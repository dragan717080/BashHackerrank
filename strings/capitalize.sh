#!/bin/bash

read -a s

for (( i=0; i<${#s[@]}; i++)); do
	(( $i == (${#s[@]} - 1))) && echo "${s[$i]^}" || echo -n "${s[$i]^} "
done

