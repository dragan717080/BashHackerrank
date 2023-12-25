#!/bin/bash

read n
for _ in $(seq $n); do
	read numerator denominator
	numerators+=($numerator)
	denominators+=($denominator)
done

euclid_gcd() {
	local a=$1
	local b=$2
	local t

	while [[ $b -ne 0 ]]; do
		t=$a
		a=$b
		b=$(( t % b ))
	done

	echo $a
}

numerators_product=$(echo "${numerators[@]}" | awk '{product = 1} { for (i=1; i<=NF; i++) product*=$i } END { print product } ')
denominators_product=$(echo "${denominators[@]}" | awk '{product = 1} { for (i=1; i<=NF; i++) product*=$i } END { print product } ')
gcd=$(euclid_gcd $numerators_product $denominators_product)
numerator=$(( numerators_product / gcd )) 3>/dev/null
denominator=$(( denominators_product / gcd )) 2>/dev/null
echo "$numerator $denominator"

