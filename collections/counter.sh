#!/bin/bash

read x
read -a sizes

read n
sum=0
for _ in $(seq $n); do
	read size price
	printf '%s\0' "${sizes[@]}" | grep -Fxqz -- "$size" && {
		for i in $(seq 0 $x); do
			[[ ${sizes[$i]} -eq $size ]] && {
				sizes=("${sizes[@]:0:$i}" "${sizes[@]:$(( i + 1 ))}")
				((sum+=$price))
				break
			}
		done
	}
done

echo $sum

