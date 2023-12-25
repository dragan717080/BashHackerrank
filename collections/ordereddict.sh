#!/bin/bash

read n
declare -A a

for _ in $(seq $n); do
	read -a arr
	price_index=$(( ${#arr[@]} - 1 ))
	product="${arr[@]:0:$price_index}"
	price="${arr[$price_index]}"
	[[ -v a["$product"] ]] && {
		((a["$product"]+=$price))
	} || {
		a["$product"]=$price
	}
done

for k in "${!a[@]}"; do
	echo "$k ${a[$k]}"
done

