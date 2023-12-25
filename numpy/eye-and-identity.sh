#!/bin/bash

read n m

for i in $(seq $n); do
	(( $i == 1 )) && echo -n "[[" || echo -n " ["
	for j in $(seq $m); do
		(( $j == $n )) && end_c="" || end_c=" "
		(( $i == $j )) && echo -n "1.$end_c" || echo -n "0.$end_c"
	done
	(( $i == $n )) && echo "]]" || echo "]"
done

