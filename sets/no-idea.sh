#!/bin/bash

read n m

read -a arr
read -a a
read -a b

count=0

for element in ${arr[@]}; do
	printf '%s\0' "${a[@]}" | grep -Fxqz -- "$element" && ((count+=1))
	printf '%s\0' "${b[@]}" | grep -Fxqz -- "$element" && ((count-=1))
done

echo $count

