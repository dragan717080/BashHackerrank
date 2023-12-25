#!/bin/bash

read -a a
read -a b

len=$(( ${#a[@]} * ${#b[@]}))
i=1
for element_a in "${a[@]}"; do
	for element_b in ${b[@]}; do
		[[ $i -eq $len ]] && c="" || c=" "
		echo -n "($element_a, $element_b)$c"
		((i+=1))
	done
done
