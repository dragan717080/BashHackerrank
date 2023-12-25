#!/bin/bash

read n

declare -A a
declare -A b
declare -A c

read_matrix () {
	local n=$1
	local -n m=$2
	
	for i in $(seq $n); do
		read -a arr
		for j in $(seq $n); do
			m[$i,$j]=${arr[$(( j - 1 ))]}
		done
	done
}

dot_product () {
	local -n a_matrix=$1
	local -n b_matrix=$2
	local -n c_arr=$3
	local n=$4

	for i in $(seq $n); do
		for j in $(seq $n); do
			c_element_sum=0
			for a_i in $(seq $n); do
				c_element_sum=$(( $c_element_sum + ${a_matrix[$i,$a_i]} * ${b[$a_i,$j]} ))
				#c_arr[$i,$j]=1
			done
			c_arr[$i,$j]=$c_element_sum
		done
	done
}

read_matrix "$n" "a"
read_matrix "$n" "b"
dot_product "a" "b" "c" $n

declare -A rows
for i in $(seq $n); do
	row=()
	for k in ${!c[@]}; do
		[[ $k =~ "$i," ]] && row+=(${c[$k]})
	done
	rows[$i]="${row[@]}"
done

for i in $(seq $n); do
	(( $i == 1 )) && echo -n "[" || echo -n " "
	echo -n "[${rows[$i]}]"
	(( $i == $n )) && echo "]" || echo ""
done

