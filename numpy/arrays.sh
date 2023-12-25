#!/bin/bash

read -a arr

arr=($(printf '%s\n' "${arr[@]}" | tac | tr '\n' ' '; echo))

echo -n "["
for (( i=0; i<${#arr[@]}; i++)); do
	! [[ $i -eq $(( ${#arr[@]} - 1 )) ]] && echo -n "${arr[$i]}. " || echo -n "${arr[$i]}."  
done
echo "]"

