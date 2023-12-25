#!/bin/bash

read n

for _ in $(seq $n); do
	read s
	regex="^([[:alnum:]_.-]+)@([[:alnum:]_.-]+)\.([[:alpha:]]{1,3})$"

	if [[ $s =~ $regex ]]; then
		echo "Good"
	else 
		echo "Wrong input"
	fi
done

