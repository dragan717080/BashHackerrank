#!/bin/bash

read n

for i in $(seq $n); do
	n1=$(( 10**i / 9 ))
	echo $(( n1**2 ))
done

