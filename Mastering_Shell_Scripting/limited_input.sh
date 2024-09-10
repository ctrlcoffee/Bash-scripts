#!/bin/bash

read -p "What is your name" name
echo "Hello $name"

#in the next line we specify the number of characters to accept before continuing
read -n1 -p "Press any key to exit"

exit 0
