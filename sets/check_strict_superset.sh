#!/bin/bash

read -a a

read n

all_superset=True
for _ in $(seq $n); do
	read -a s
	count=0
	for element in ${a[@]}; do
		printf '%s\0' "${s[@]}" | grep -Fxqz -- "$element" && ((count+=1))
	done
	[[ $count -eq ${#s[@]} ]] || all_superset=False
done
echo $all_superset

