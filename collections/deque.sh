#!/bin/bash

read n

for _ in $(seq $n); do
	read command element
	if [[ $command == "append" ]]; then
		arr+=("$element")
	elif [[ $command == "appendleft" ]]; then
		arr=("$element" "${arr[@]}")
	elif [[ $command == "pop" ]]; then
		last_index=$(( ${#arr[@]} - 1 ))
		arr=("${arr[@]:0:$(( ${#arr[@]} - 1 ))}")
	elif [[ $command == "popleft" ]]; then
		arr=("${arr[@]:1}")
	elif [[ $command == "reverse" ]]; then
		arr=($(printf '%s\n' "${arr[@]}" | tac | tr '\n' ' '; echo ))
	fi
done

echo "${arr[@]}"

