#!/bin/bash


echo "this file accepts $# arguments"
echo "this is the $0 file"
echo "Hello $3"
echo "printing all arguments : $*"

#if you only want the name of the script to show and not it's path:
echo "you are using $(basename $0)"
