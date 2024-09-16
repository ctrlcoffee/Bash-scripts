#!/bin/bash
#$name=$1
#[ -z $name ] && name="Anonymous"
#echo "hello $name"
#exit 0



#using parameter substitution to provide default value
name=${1-"Anonymous"}
echo "Hello $name"
exit
