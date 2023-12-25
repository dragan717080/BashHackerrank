#!/bin/bash

read n
declare -A arr

for i in $(seq $n); do
	read a b
	arr[$a,$b]=1
done

for k in ${!arr[@]}; do
	IFS=',' read -ra num_arr <<< "$k"
	read a b <<<$(echo "${num_arr[@]}")
	if ! [[ "$a" -eq "$a" ]] 2>/dev/null; then
		echo "Error Code: invalid literal for int() with base 10: '$a'"
		continue
	elif ! [[ "$b" -eq "$b" ]] 2>/dev/null; then
		echo "Error Code: invalid literal for int() with base 10: '$b'"
		continue
	elif [[ "$b" -eq "0" ]] 2>/dev/null; then
		echo "Error Code: integer division or modulo by zero"
		continue
	fi
	echo $(( a / b ))
done

