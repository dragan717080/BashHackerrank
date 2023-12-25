#!/bin/bash

read n

decimal_to_octal() {
    local decimal=$1

    if [ $decimal -lt 8 ]; then
        echo -n $decimal
    else
        local remainder=$((decimal % 8))
        local quotient=$((decimal / 8))
        local result=$(decimal_to_octal $quotient)

        echo -n $result$remainder
    fi
}

decimal_to_hex() {  
	decimal_number=$1
	result=$(printf "%X" "$decimal_number")
	
	echo "$result"
}

decimal_to_bin() {
    local decimal=$1

    # Base case: if the decimal number is less than 2, return its binary representation
    if [ $decimal -lt 2 ]; then
        echo -n $decimal
    else
        # Recursive case: divide the decimal by 2 and call the function again
        local remainder=$((decimal % 2))
        local quotient=$((decimal / 2))
        local result=$(decimal_to_bin $quotient)

        echo -n $result$remainder
    fi
}

result=$(decimal_to_octal $n)

for i in $(seq $n); do
	octal=$(decimal_to_octal $i)
	hex=$(decimal_to_hex $i)
	bin=$(decimal_to_bin $i)
	[[ i -gt 9 ]] && echo -n "$i" || echo -n " $i"
	echo -n "    "
	if [[ octal -le 9 ]]; then
		echo -n "  $octal"
	elif [[ octal -le 99 ]]; then
		echo -n " $octal"
	else echo -n "$octal"
	fi
	echo -n "    "
	[[ i -le 15 ]] && echo -n " $hex" || echo -n "$hex"
	to_move=$(( 4 + 7 - ${#bin} ))
	printf -- ' %.0s' $(seq $to_move)
	echo "$bin"
done


