#!/bin/bash

read x
read y
read z
read n

s="["
for i in $(seq 0 $(( x ))); do 
	for j in $(seq 0 $(( y ))); do
		for k in $(seq 0 $(( z ))); do
			[[ $(( i + j + k )) -ne $n ]] && s+="[$i, $j, $k], "
		done
	done
done
s="${s::-2}]" 
echo $s

