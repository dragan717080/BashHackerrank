#!/bin/bash

read -a a
read -a b

n=${#a[@]}

inner=0
declare -A outer
for i in $(seq 0 $(( n - 1))); do
	((inner+=$(( ${a[$i]} * ${b[$i]} )) ))
	for j in $(seq 0 $(( n - 1 ))); do
		c_i=$(( i + 1 )); c_j=$(( j + 1 ))
		outer[$c_i,$c_j]=$(( ${a[$i]} * ${b[$j]} ))
	done
done

echo $inner

#declare -A rows
for i in $(seq $n); do
	row=()
	for j in $(seq $n); do row+=(${outer[$i,$j]}); done
	(( $i == 1 )) && echo -n "[" || echo -n " "
	echo -n "[${row[@]}]"
	(( $i == $n )) && echo "]" || echo "" 
done


