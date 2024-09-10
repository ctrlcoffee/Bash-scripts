#!/bin/bash

RUST_SCAN_BIN="/home/kali/tools/RustScan/targer/release/rustscan"


LOG_FILE="watchdog.log"
IP_ADDRESS="$1"
WATCHED_PORT="$2"


service_discovery(){
	local host
	local port
	host="${1}"
	port="${2}"

	nmap -sV -p "${port}" "${host}" >> "${LOG_FILE}"
}

while true; do 
	port_scan=$(rustscan -a "${IP_ADDRESS}" -g -p "${WATCHED_PORT}")
	if [[ -n "${port_scan}" ]]; then
		echo "${IP_ADDRESS} has started responsing on port ${WATCHED_PORT}!"
		echo "Performing a service discovery ..."
		if service_discovery "${IP_ADDRESS}" "${WATCHED_PORT}"; then
			echo "Wrote port scan data to ${LOG_FILE}"
			break
		fi
	else
		echo "Port not yet open or was close , sleeping for 5 seconds."
		sleep 5
	fi
done