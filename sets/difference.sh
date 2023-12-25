#!/bin/bash

read _
read -a a

read _
read -a b

count=0
for element in ${a[@]}; do
	if printf '%s\0' "${b[@]}" | grep -Fxqz -- "$element"; then :; else ((count+=1)); fi
done

echo $count

