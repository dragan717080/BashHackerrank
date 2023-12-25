#!/bin/bash

read -a arr
declare -A a

for ((i=0; i<3; i++)); do
	a[$i]="${arr[@]:$(( 3*$i )):3}"
done

keys=("${!a[@]}")
for ((i=0; i<${#keys[@]}; i++)); do
	k="${keys[$i]}"
	v="${a[$k]}"

	(( $i == 0 )) && echo "[[${v[@]}]"
	(( $i == 1 )) && echo " [${v[@]}]"
	(( $i == ${#keys[@]} -1 )) && echo " [${v[@]}]]"

done

