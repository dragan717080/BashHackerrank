#!/bin/bash

read n

for _ in $(seq $n); do
	read s
	regex="^([[:alnum:]_.-]+)@([[:alnum:]_.-]+)\.([[:alpha:]]{1,3})$"

	[[ $s =~ $regex ]] && echo "Good" || echo "Wrong input"
done
