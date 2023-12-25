#!/bin/bash

read n

dots=$(( (n - 1) * 2 ))

echo_dots () {
	dots=$1
	for j in $(seq $dots); do
		echo -n "-"
	done
}

echo_letters () {
	i=$1
	distance=$(( n - i ))
	first_letter_code=$(( 97 + distance ))
	for j in $(seq $i); do
		letter_code=$(( 97 + n - j ))
		letter=$(printf "\\$(printf '%03o' "$letter_code")")
		(( $j == $i )) && echo -n "$letter" || echo -n "$letter-"
	done
	remaining_letters=$(( i - 1 ))
	for j in $(seq $remaining_letters); do
		letter_code=$(( first_letter_code + j ))
		letter=$(printf "\\$(printf '%03o' "$letter_code")")
		printf -- '-%s' "$letter"
	done
}

echo_remaining_letters () {
	i=$1
	distance=$(( n - i ))
	first_letter_code=$(( 97 + n - 1 ))
	for j in $(seq $distance); do
		letter_code=$(( first_letter_code - j + 1 ))
		letter=$(printf "\\$(printf '%03o' "$letter_code")")
		(( $j == $distance )) && echo -n "$letter" || echo -n "$letter-"
	done
	remaining_letters=$(( n - i - 1 ))
	first_letter_code=$(( 97 + i + 1 ))
	for j in $(seq $remaining_letters); do
		letter_code=$(( first_letter_code + j - 1 ))
		letter=$(printf "\\$(printf '%03o' "$letter_code")")
		printf -- "-%s" "$letter"
	done
}

for i in $(seq $n); do
	echo_dots "$dots"
	echo_letters "$i"
	echo_dots "$dots"
	echo ""
	((dots-=2))
done

dots=2
for i in $(seq $(( n - 1 ))); do
	echo_dots "$dots"
	echo_remaining_letters "$i"
	echo_dots "$dots"
	echo ""
	((dots+=2))
done

