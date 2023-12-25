#!/bin/bash

read rows cols
declare -A a
flattened=()

for i in $(seq $rows); do
	read -a arr
	for j in $(seq $cols); do
		element=${arr[$(( j - 1 ))]}
		a[$i,$j]=$element
		flattened+=("$element")
	done
done

declare -A transposed

for (( i=1; i<=$rows; i++ )); do
	for (( j=1; j<=$cols; j++)); do
		transposed[$j,$i]=${a[$i,$j]};
	done
done

for i in $(seq $cols); do
	arr=()
	for j in $(seq $rows); do
		arr+=(${transposed[$i,$j]})
	done

	(( $i == 1 )) && {
		echo -n "[[${arr[@]}]"
		(( $i == $cols )) && {
			echo "]"
			break
		} || {
			echo ""; echo -n " "; continue
		}
	}

	echo -n "[${arr[@]}]"
	(( $i == $cols )) && {
		echo "]"
	} || {
		echo ""; echo -n " "; continue
	}
done

echo ["${flattened[@]}"]

