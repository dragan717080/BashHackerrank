#!/bin/bash

read n

declare -A a

for row in $(seq 1 $(( n ))); do
	IFS=' ' read -a line
	name=${line[0]}
	marks=${line[@]:1}
	a["$name"]=$marks
done

read query_name

arr=${a[$query_name]}

echo "${arr[@]}" | awk '{ for (i=1; i<=NF; i++) sum+=$i; sum/=NF; } END {printf "%.2f", sum}'

