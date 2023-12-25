#!/bin/bash

read -a coefs

read x

sum=0
for coef in ${coefs[@]}; do
	sum=$(awk -v a="$sum" -v b="$x" -v c="$coef" 'BEGIN { printf "%.1f", a * b + c } ')
done

echo $sum

