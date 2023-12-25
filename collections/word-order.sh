#!/bin/bash

read n
declare -A a

for _ in $(seq $n); do
	read s
	printf '%s\0' "${words[@]}" | grep -Fxqz -- "$s" || words+=($s)
	[[ -v a[$s] ]] && {
		((a[$s]+=1))
	} || {
		a[$s]=1
	}
done

echo ${#a[@]}

for word in ${words[@]}; do
	echo -n "${a[$word]} "
done

