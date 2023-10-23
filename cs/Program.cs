using System;
using System.Collections;
using System.Net;
using System.Net.Security;
using System.Net.Sockets;
using System.Security.Authentication;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.IO;

// https://learn.microsoft.com/en-us/dotnet/api/system.net.security.sslstream?view=netcore-3.1

namespace Examples.System.Net
{
    public class SslTcpClient
    {
        private static Hashtable certificateErrors = new Hashtable();

        // The following method is invoked by the RemoteCertificateValidationDelegate.
        public static bool ValidateServerCertificate(
              object sender,
              X509Certificate certificate,
              X509Chain chain,
              SslPolicyErrors sslPolicyErrors)
        {
            if (sslPolicyErrors == SslPolicyErrors.None)
            {
                return true;
            }

            Console.Error.WriteLine("[ERROR] certificate error: {0}", sslPolicyErrors);

            // Do not allow this client to communicate with unauthenticated servers.
            return false;
        }

        public static void RunClient(string hostName, string serverName, ushort port)
        {
            using (var client = new TcpClient(hostName, port))
            {
                Console.WriteLine("[INFO] client connected to '{0}:{1}'", hostName, port);

                using (var sslStream = new SslStream(
                    client.GetStream(),
                    false,
                    new RemoteCertificateValidationCallback(ValidateServerCertificate),
                    null
                    ))
                {
                    try
                    {
                        sslStream.AuthenticateAsClient(serverName);
                    }
                    catch (AuthenticationException e)
                    {
                        Console.Error.WriteLine("[ERROR] exception: {0}", e.Message);
                        if (e.InnerException != null)
                        {
                            Console.Error.WriteLine("[ERROR] inner exception: {0}", e.InnerException.Message);
                        }
                        Console.Error.WriteLine("[ERROR] authentication failed - closing the connection.");
                        client.Close();
                        return;
                    }

                    // Encode a test message into a byte array.
                    // Signal the end of the message using the "<EOF>".
                    byte[] messsage = Encoding.UTF8.GetBytes("Hello from the client.<EOF>");

                    // Send hello message to the server.
                    sslStream.Write(messsage);
                    sslStream.Flush();

                    // Read message from the server.
                    string serverMessage = ReadMessage(sslStream);
                    Console.WriteLine("[INFO] server says: {0}", serverMessage);

                }
            }

            Console.WriteLine("[INFO] client closed.");
        }

        static string ReadMessage(SslStream sslStream)
        {
            // Read the  message sent by the server.
            // The end of the message is signaled using the
            // "<EOF>" marker.
            byte[] buffer = new byte[2048];
            StringBuilder messageData = new StringBuilder();
            int bytes = -1;
            do
            {
                bytes = sslStream.Read(buffer, 0, buffer.Length);

                // Use Decoder class to convert from bytes to UTF8
                // in case a character spans two buffers.
                Decoder decoder = Encoding.UTF8.GetDecoder();
                char[] chars = new char[decoder.GetCharCount(buffer, 0, bytes)];
                decoder.GetChars(buffer, 0, bytes, chars, 0);
                messageData.Append(chars);
                // Check for EOF.
                if (messageData.ToString().IndexOf("<EOF>") != -1)
                {
                    break;
                }
            } while (bytes != 0);

            return messageData.ToString();
        }

        private static void DisplayUsage()
        {
            Console.WriteLine("[INFO] to start the client specify:");
            Console.WriteLine("       dotnet run [hostname] [port] [servername]");
            Environment.Exit(1);
        }

        public static int Main(string[] args)
        {
            string hostName = "localhost";
            ushort port = 4433;
            string serverName = "localhost";

            if (args.Length > 0)
            {
                string argHostName = args[0];
                if (String.IsNullOrWhiteSpace(argHostName))
                {
                    hostName = "localhost";
                }
                else
                {
                    hostName = argHostName;
                    Console.WriteLine("[INFO] hostname: {0}", hostName);
                }
            }

            if (args.Length > 1)
            {
                string portStr = args[1];
                if (false == ushort.TryParse(portStr, out port))
                {
                    port = 4433;
                }
                Console.WriteLine("[INFO] port: {0}", port);
            }

            if (args.Length > 2)
            {
                serverName = args[2];
                if (string.IsNullOrWhiteSpace(serverName))
                {
                    serverName = hostName;
                }
            }
            Console.WriteLine("[INFO] servername: {0}", serverName);

            RunClient(hostName, serverName, port);

            return 0;
        }
    }
}
