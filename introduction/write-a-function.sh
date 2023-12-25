#!/bin/bash

is_leap() {
	local -n var=$1
	var=$(( var ))
	if (( var % 4 == 0 && (var % 100 != 0 || var % 400 == 0 ))); then
		echo "True"
	else
		echo "False"
	fi
}

read year
is_leap year

