#!/bin/bash

read n

for _ in $(seq $n); do
	read s
	start_index=$(( ${#s} - 10 ))
	s=${s:$start_index}
	echo "+91 ${s:0:5} ${s:5:10}"
done

