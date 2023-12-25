#!/bin/bash

read _
read -a a

read _
read -a b

declare -a union

for element in ${a[@]}; do
	union[$element]=1
done

for element in ${b[@]}; do
	union[$element]=1
done

echo ${#union[@]}

