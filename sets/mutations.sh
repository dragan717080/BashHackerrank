#!/bin/bash

read _
read -a a

read n
for _ in $(seq $n); do
	read command count <<< "$(read -a arr && echo "${arr[@]}")"
	read -a b
	if [[ ${command:0:1} = 'u' ]]; then
		a+=("${b[@]}")
	elif [[ ${command:0:1} = 'i' ]]; then
		s=()
		for element in ${a[@]}; do
			if printf '%s\0' "${b[@]}" | grep -Fxqz -- "$element"
				then s+=($element)
			fi
			a=("${s[@]}")
		done
	elif [[ ${command:0:1} = 's' ]]; then
		s=()
		for element in ${a[@]}; do
			printf '%s\0' "${b[@]}" | grep -Fxqz -- "$element" || s+=($element)
		done

		for element in ${b[@]}; do
			printf '%s\0' "${a[@]}" | grep -Fxqz -- "$element" || s+=($element)
		done
		a=("${s[@]}")
	elif [[ ${command:0:1} = 'd' ]]; then
		s=()
		for element in ${a[@]}; do
			printf '%s\0' "${b[@]}" | grep -Fxqz -- "$element" || s+=($element)
		done
		a=("${s[@]}")
	fi
done

sum=$(echo "${a[@]}" | awk '{ for (i=1; i<=NF; i++) sum+=$i } END {print sum}')
echo $sum

