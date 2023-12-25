#!/bin/bash

read s
read sub

count=0
sub_index=0

last_element=${sub: $((${#sub} - 1))}
for c in $(echo "$s" | grep -o .); do
	if [[ $c == ${sub:$sub_index:1} ]]; then
		(( sub_index++ ))
	fi
	if [[ $sub_index -eq ${#sub} ]]; then
		sub_index=0
		count=$(( count + 1 ))
	fi
done

echo $count

