#!/bin/bash
DEFAULT_PORT="80"

read -r -p "Type a target ip address: " ip
read -r -p "type a target port (default:80 ):" port


if [[ -z "${ip}" ]]; then
	echo "you must provide an ip address"
	exit 1
fi

if [[ -z ${port} ]]; then
	echo "You did not provide a port, defaulting to ${DEFAULT_PORT}"
	port=${DEFAULT_PORT}
fi


echo "Attempting to grab the server header of ${ip}..."

result=$(curl -s --head "${ip}:${port}" | grep Server | awk -F':' '{print $2}')
echo "Server header for ${ip} on port ${port} is:${result}"