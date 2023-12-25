#!/bin/bash

read n m

declare -A a
for i in $(seq $m); do
	read -a row
	for j in $(seq ${#row[@]}); do
		a[$i,$j]=${row[$(( j - 1 ))]}
	done
done
		
rows=$m; cols=$n;
declare -A res

for i in $(seq $cols); do
	for j in $(seq $rows); do
		res[$i,$j]=${a["$j,$i"]}
	done
done

for i in $(seq $cols); do
	arr=()
	for k in "${!res[@]}"; do
		first_number="${k%,*}"
		if [[ "$first_number" -eq $i ]]; then
			arr+=("${res[$k]}")
		fi
	done
	sum=$(echo "${arr[@]}" | awk '{ for (i=1; i<=NF; i++) sum+=$i } END {print sum}')
	result=$(awk -v a="$sum" -v b="${#arr[@]}" 'BEGIN {printf "%.1f", a / b}')
	echo "$result"
done

