#!/bin/bash

read s
declare -A a

for char in $(echo "$s" | grep -o .); do
	[[ -v a[$char] ]] && ((a[$char]+=1)) || ((a[$char]=1))
done

arr=($(for k in ${!a[@]}; do
        echo $k ${a[$k]}
done | sort -nr -k2))

declare -A sorted_arr

for (( i=0; i<6; i++)); do
	if (( $i % 2 == 0 )); then {
		current_key="${arr[$i]}"
		sorted_keys+=("$current_key")
	} else {
		sorted_arr[$current_key]="${arr[$i]}"
	} fi

done

for k in ${sorted_keys[@]}; do
	echo "$k ${sorted_arr[$k]}"
done

