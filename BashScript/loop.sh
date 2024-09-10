#!/bin/bash



SIGNAL_TO_STOP_FILE="stoploop"

while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do 
	echo "the file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
	echo "Checking again in 2 seconds ... "
	sleep 2
done


echo "File was found ! exiting ... "