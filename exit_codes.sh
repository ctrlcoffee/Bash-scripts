#!/bin/bash


ls -l > /dev/null

echo "the status code of the ls command was : $?"


lzl 2> /dev/null

echo "the status code of the non-existing lzl command was: $?"


