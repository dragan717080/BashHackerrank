#!/bin/bash

read n m
declare -A a

for i in $(seq $n); do
	read -a arr
	a[$i]="${arr[@]}"
done

read col

col_values=()
for k in ${!a[@]}; do
	read -ra columns <<< "${a[$k]}"
	col_values+=("${columns[$col]}")
done

IFS=$'\n' col_values=($(sort -n <<< "${col_values[*]}"))
declare -A result

i=0
for col_value in "${col_values[@]}"; do
	for k in "${!a[@]}"; do
		IFS=' '; read -ra columns <<< "${a[$k]}"
		arr_col_value="${columns[$col]}"
		[[ $col_value -eq $arr_col_value ]] && { result[$i]="${columns[@]}"; ((i+=1)); columns=(); break; }
	done
done
for k in "${!result[@]}"; do
	echo "${result[$k]}"
done

