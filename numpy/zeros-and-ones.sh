#!/bin/bash

read n m t

# zeros
for matrix_i in $(seq $t); do
	(( $matrix_i == 1 )) && echo -n "[[" || echo -n "["
	for i in $(seq $n); do
		(( $i == 1 )) && echo -n "[" || echo -n " ["
		for j in $(seq $m); do
			(( $j == $m )) && echo -n "0" || echo -n "0 "
		done

		(( $i == $n )) && echo -n "]" || echo "]"
		#(( $matrix_i == $t )) && echo "]]" || echo "]"
	done
	(( $matrix_i == $t )) && echo "]]" || echo -e "]\n"
done

#ones
for matrix_i in $(seq $t); do
        (( $matrix_i == 1 )) && echo -n "[[" || echo -n "["
        for i in $(seq $n); do
		[[ $matrix_1 -eq 1 && $i -ne 1 ]] && echo -n " "
                (( $i == 1 )) && echo -n "[" || echo -n " ["
                for j in $(seq $m); do
                        (( $j == $m )) && echo -n "1" || echo -n "1 "
                done

                (( $i == $n )) && echo -n "]" || echo "]"
                #(( $matrix_i == $t )) && echo "]]" || echo "]"
        done
        (( $matrix_i == $t )) && echo "]]" || echo -e "]\n"
done

