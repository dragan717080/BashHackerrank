#!/bin/bash

read a
read b

result=$(awk -v a="$a" -v b="$b" 'BEGIN {printf "%.11f", a / b}')
if [[ $result =~ ^[0-9]+.[0]{11}$ ]]; then
	echo ${result:0:1}
else 
	echo $result
fi

