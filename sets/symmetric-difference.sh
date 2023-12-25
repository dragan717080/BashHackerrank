#!/bin/bash

read m
read -a a

read n
read -a b

c=()
for element in ${a[@]}; do
	printf '%s\0' "${b[@]}" | grep -Fxqz -- $element || c+=("$element")
done
for element in ${b[@]}; do
	printf '%s\0' "${a[@]}" | grep -Fxqz -- $element || c+=("$element")
done

IFS=$'\n' sorted=($(sort -n <<<"{c[*]}"))
unset IFS

printf "%s\n" "${c[@]}"

