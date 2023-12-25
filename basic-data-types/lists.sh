#!/bin/bash

read n

arr=()

for _ in $(seq 1 $(( $n ))); do
	read -r command elements <<< "$(read -a arr && echo "${arr[@]}")"
	if [[ ${#elements} == 0 ]]; then 
		if [[ $command == "sort" ]]; then
			IFS=$'\n' arr=($(sort -n <<<"${arr[*]}"))
			unset IFS
		elif [[ $command == "pop" ]]; then
			unset "arr[-1]"
		elif [[ $command == "reverse" ]]; then
			arr=($(printf '%s\n' "${arr[@]}" | tac | tr '\n' ' '))
		else IFS=", "; echo "[${arr[*]}]"
		fi
	elif [[ $command == insert ]]; then
		i=${elements:0:1}; v=${elements:2:${#elements}}
		arr=("${arr[@]:0:$i}" "$v" "${arr[@]:$i}")
	else
		if [[ $command == "append" ]]; then
			arr+=(${elements[@]})
		else
			echo "${arr[@]}/${elements[2]}"
		fi
	fi
done

