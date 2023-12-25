#!/bin/bash

read n

declare -A arr

for i in $(seq 1 $(( n ))); do
	read name
	read grade
	arr["$name"]=$grade
done

declare -A set_values

for k in ${arr[@]}; do set_values[$k]=1; done

IFS=$'\n' sorted_set_values=($(sort -n <<<"${!set_values[*]}"))
unset IFS
second_lowest_value="${sorted_set_values[1]}";
matching_names=()
for name in "${!arr[@]}"; do
	if [[ ${arr[$name]} == $second_lowest_value ]]; then
		matching_names+=("$name")
	fi
done

IFS=$'\n' sorted_names=($(sort <<<"${matching_names[*]}"))
unset IFS
printf "%s\n" "${sorted_names[@]}"

