#!/bin/bash

read n m
declare -A a

for i in $(seq $n); do
	read -a arr
	for j in $(seq $m); do
		a[$i,$j]=${arr[$(( j - 1 ))]}
	done
done

for i in $(seq $n); do
	arr=()
	for k in ${!a[@]}; do
		[[ $k =~ "$i," ]] && arr+=(${a[$k]})
	done
	min=${arr[0]}
	for element in ${arr[@]}; do
		(( element < $min )) && min=$element
	done
	mins+=($min)
done

max=${mins[0]}

for (( i=1; i<${#mins[@]}; i++)); do
	[[ ${mins[$i]} -gt $max ]] && max=${mins[$i]}
done

echo $max

