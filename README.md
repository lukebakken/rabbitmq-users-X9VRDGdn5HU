# Environment

```
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.3 LTS"
```

```
lbakken@PROKOFIEV ~/development/lukebakken/rabbitmq-users-X9VRDGdn5HU (main *=)
$ openssl version
OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)

lbakken@PROKOFIEV ~/development/lukebakken/rabbitmq-users-X9VRDGdn5HU (main *=)
$ openssl version -d
OPENSSLDIR: "/usr/lib/ssl"
```

# Run RabbitMQ

The following command downloads and starts RabbitMQ 3.12.7, using a configuration file that enables TLS using the certs in the `certs` dir:


```
./run-rabbitmq.sh
```

# TLS client examples

The `run-tls-client.sh` script takes two optional arguments.

## Run `openssl s_client` using TLS 1.2 against RabbitMQ port 5671

```
./run-tls-client.sh -tls1_2 5671
```

## Run `openssl s_client` using TLS 1.3 against RabbitMQ port 5671

```
./run-tls-client.sh -tls1_3 5671
```

## Run `openssl s_client` using TLS 1.2 or 1.3 against RabbitMQ port 5671

```
./run-tls-client.sh '-no_ssl3 -no_tls1' 5671
```
