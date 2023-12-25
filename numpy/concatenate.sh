#!/bin/bash

read n m p

n=$(( n + m ))
for i in $(seq $n); do
	read arr
	a="${arr[@]}"
	(( $i == 1 )) && { echo "[[$a]"; continue; }
	(( $i == $n )) && { echo " [$a]]"; continue; }
	echo " [$a]"

done

