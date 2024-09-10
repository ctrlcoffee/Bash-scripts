#!/bin/bash

myarr=(this is an array)

echo "printing array elements"
echo ${myarr[0]}
echo ${myarr[1]}
echo ${myarr[2]}
echo ${myarr[3]}

echo ${myarr[*]}

#to remove an element
unset myarray[1]

