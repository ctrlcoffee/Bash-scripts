#!/bin/bash
main="1234"
read -s -p "Enter your password:" password
# -s is for silent input.
# -n1 is for limiting input.
if [[ -z $password ]]; then
     echo "You must provide a password"
    ./silent_input.sh
    exit 0
else
    if [[ $password -eq $main ]]; then
        echo "correct password!"
    else
        echo "Password is incorrect"
    fi
fi
exit 0
