#!/bin/bash

read n

for _ in $(seq $n); do
	read _
	read -a a
	read _
	read -a b

	matches=0
	for element in ${a[@]}; do
		printf '%s\0' "${b[@]}" | grep -Fxqz -- "$element" && ((matches+=1))
	done
	[[ matches -eq ${#a[@]} ]] && echo "True" || echo "False"
done

