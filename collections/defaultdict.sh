#!/bin/bash

read n m
declare -A a

for i in $(seq $n); do
	read s
	a[$i]=$s
done

for _ in $(seq $m); do
	read s
	search_words+=($s)
done

for search_word in ${search_words[@]}; do
	printf '%s\0' "${a[@]}" | grep -Fxqz -- "$search_word" && {
		for k in ${!a[@]}; do
			[[ ${a[$k]} == $search_word ]] && echo -n "$k "
		done
		echo ""
	} || echo "-1"
done

