#!/bin/bash

read n m
declare -A a

for i in $(seq $n); do
	read -a arr
	for j in $(seq $m); do
		a[$i,$j]=${arr[$(( j - 1 ))]}
	done
done

for col in $(seq $m); do
	col_sum=0
	for k in ${!a[@]}; do
		[[ $k =~ ",$col" ]] && ((col_sum+=${a[$k]}))
	done
	col_sums+=($col_sum)
done

echo "${col_sums[@]}" | awk '{ product = 1; for (i=1; i<=NF; i++) product *= $i } END { print product } '

