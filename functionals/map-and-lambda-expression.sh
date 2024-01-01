#!/bin/bash

read n

if [[ $n -le 0 ]]; then echo "Input must be positive"; exit 1
elif [[ $n -eq 1 ]]; then echo "[0]"; exit 1
elif [[ $n -eq 2 ]]; then echo "[0, 1]" 
fi

arr=(0 1)
for i in $(seq 2 $(( n - 1))); do
	sum_last_two=$(( ${arr[$i - 1]} + ${arr[$i - 2]} ))
	arr+=($sum_last_two)
done
for i in ${arr[@]}; do
	result+=("$(( $i**3 ))")
done
IFS=", "
result="${result[*]}"
IFS=$' \t\n'
result=$(echo "$result" | sed "s/,/, /g")
echo "[$result]"
