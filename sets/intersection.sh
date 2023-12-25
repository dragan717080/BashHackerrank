#!/bin/bash

read _
read -a a

read _
read -a b

declare -a s

for element in ${a[@]}; do
	s[$element]=1
done

count=0

for element in ${b[@]}; do
	[[ -v s[$element] ]] && ((count+=1))
done

echo $count

