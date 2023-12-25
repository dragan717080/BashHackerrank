#!/bin/bash

read w

for i in $(seq 1 $(( w - 1 ))); do
	s=""
	initial_spaces=$(echo "$(( w - i ))" | sed 's/-//')
    
    	spaces=$(printf '%*s' "$initial_spaces" ' ')

    	letters=$(printf '%*s' "$(( 2 * i - 1 ))" | tr ' ' 'H')
    	echo "$spaces$letters$spaces"
done

next_lines=6

w=$(( w ))
w_letters=""
w_spaces=""
w_fill=""
for i in $(seq 1 $(( w ))); do
	w_letters+="H"
done
for i in {1..12}; do
	w_spaces+=" "
	w_fill+="H"
done
for i in {1..6}; do
	echo "  $w_letters$w_spaces$w_letters          "	
done
for i in {1..3}; do
	echo "  $w_letters$w_fill${w_letters}HHH  "
done
for i in {1..6}; do
        echo "  $w_letters$w_spaces$w_letters          "
done
start_spaces=$(( 2 + w + 12 - w / 2 - 1 ))
start_letters=$(( w * 2 - 1 ))
for i in $(seq 1 $(( w ))); do
	for j in $(seq 1 $((start_spaces))); do
		echo -n " "
	done
	for j in $(seq 1 $((start_letters))); do
		echo -n "H"
	done
	for j in $(seq 1 $(( w ))); do
		echo -n " "
	done
	((start_spaces++))
	((start_letters-=2))
	echo ""
done

