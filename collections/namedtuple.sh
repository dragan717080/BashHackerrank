#!/bin/bash

read n

read -a column_names
declare -A students

for i in $(seq $n); do
	read -a arr
	students[$i]="${arr[@]}"
done

for (( i=0; i<${#column_names[@]}; i++)); do
	[[ ${column_names[$i]} == "MARKS" ]] && {
		marks_index=$i
		break
	}
done

sum=0

for k in ${!students[@]}; do
	IFS=' ' read -ra arr <<< "${students[$k]}"
	((sum+=${arr[$marks_index]}))
	unset IFS
done

awk -v a="$sum" -v b="$n" 'BEGIN { printf "%.2f", a / b }'

