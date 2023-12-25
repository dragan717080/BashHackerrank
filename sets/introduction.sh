#!/bin/bash

read n

declare -A arr
read -a input_arr
for d in ${input_arr[@]}; do arr[$d]=1; done

n=${#arr[@]}
sum=$(echo "${!arr[@]}" | awk '
	{ for (i=1; i<=NF; i++) sum+=$i } END {print sum}
')

result=$(awk -v sum="$sum" -v n="$n" 'BEGIN {printf "%.3f", sum / n }')
echo "$result"

