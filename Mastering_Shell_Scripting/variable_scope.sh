#!/bin/bash
name="paryah"
#use export keyword so the variable will be accessible go other processes

export name
./variable_scope2.sh
echo $name
