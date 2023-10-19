#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
readonly script_dir

readonly rmq_version='3.12.7'
readonly rmq_xz="$script_dir/rabbitmq-server-generic-unix-$rmq_version.tar.xz"
readonly rmq_dir="$script_dir/rabbitmq_server-$rmq_version"
readonly rmq_download_url="https://github.com/rabbitmq/rabbitmq-server/releases/download/v$rmq_version/$rmq_xz"

if [[ ! -s $rmq_xz ]]
then
    curl -LO "$rmq_download_url"
fi

if [[ ! -d $rmq_dir ]]
then
    tar xf "$rmq_xz"
fi

sed -e "s#@@SCRIPT_DIR@@#$script_dir#g" rabbitmq.conf.in > rabbitmq.conf

RABBITMQ_CONFIG_FILE="$script_dir/rabbitmq.conf" RABBITMQ_ALLOW_INPUT='true' "$rmq_dir/sbin/rabbitmq-server"
