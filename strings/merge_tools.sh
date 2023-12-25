#!/bin/bash

merge_tools () {
	s="$1"
	k="$2"
	for (( i=0; i<${#s}; i+=3 )); do
		a=()
		for j in $(seq $i $(( i + 2 ))); do
			current_char=${s:$j:1}
			printf '%s\0' "${a[@]}" | grep -Fxqz -- "$current_char" || {
	echo -n "$current_char"
	a+=("$current_char")
   }
		done
		echo ""
	done
}

read s
read k

merge_tools "$s" "$k"

