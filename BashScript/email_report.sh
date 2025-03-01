#!/bin/bash


#sends  a notification upon new host discovery

KNOWN_HOSTS="network_hosts.txt"
NETWORK="192.168.1.0/24"

INTERFACE="eth0"

FROM_ADDR="kali@blackhatbash.com"
TO_ADDR="security@blackhatbash.com"



while true; do 
	echo "Performing an ARP scan against ${NETWORK}..."

	sudo arp-scan -x -I ${INTERFACE} ${NETWORK} | while read -r line; do
		host="$(echo "${line}" | awk '{print $1}')"
		if ! grep -q "${host}" "${KNOWN_HOSTS}"; then
			echo "Found a new host: ${host}!"
			echo "${host}" >> "${KNOWN_HOSTS}"
			sendmail -f "${FROM_ADDR}" \
				-t "${TO_ADDR}" \
				-u "ARP SCAN NOTIFICATION" \
				-m "A new host was found ${host}"
		fi
	done


	sleep 10
done
