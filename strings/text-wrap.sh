#!/bin/bash

read s
read w

for i in $(seq 	0 $(( ${#s} / w ))); do
	start_index=$(( 4 * i ))
	echo "${s:$start_index:4 }"
done

