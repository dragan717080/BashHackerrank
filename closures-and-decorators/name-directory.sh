#!/bin/bash

read n

for _ in $(seq $n); do
	read -r s
	arr+=("$s")
done

mapfile -t sorted < <(printf "%s\n" "${arr[@]})" | sort -k3,3n)

for element in "${sorted[@]}"; do
	read -ra person <<< "$element"
	gender=${person[3]:0:1}
	[[ $gender == "M" ]] && echo -n "Mr. " || echo -n "Ms. "
	echo "${person[0]} ${person[1]}"
done

