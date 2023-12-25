#!/bin/bash

read n
read -a input_arr

declare -A arr
for item in ${input_arr[@]}; do arr[$item]=1; done;
sorted_arr=($(echo "${!arr[@]}" | tr ' ' '\n' | sort -r))
echo "${sorted_arr[1]}"

