#!/bin/bash

read n

read -a arr

read k

declare -A indices

for (( i=0; i<${#arr[@]}; i++ )); do
	len=${#arr[@]}
	rest=("${arr[@]:0:$i}" "${arr[@]:$(( i + 1 ))}")
	indexes_before=($(seq 0 $(( i - 1 ))))
	indexes_after=($(seq $(( i + 1 )) $((${#arr[@]} - 1))))
	rest=("${indexes_before[@]}" "${indexes_after[@]}")
	for (( j=0; j<${#rest[@]}; j++)); do ((rest[j]+=1)); done
	for rest_item in "${rest[@]}"; do
		previous_perm="indices[$rest_item,$(( i + 1 ))]"
		current_perm="indices[$(( i + 1 )),$rest_item]"
		[[ -v $previous_perm ]] || indices[$(( i + 1 )),$rest_item]=1
	done
done

keys_num=${#indices[@]}
for key in ${!indices[@]}; do
	for d in $(seq $k); do
		[[ $key =~ $d ]] && { 
			((count+=1))
			break
		}
	done
done

awk -v a="$count" -v b="$keys_num" 'BEGIN { printf "%.4f", a / b }'

