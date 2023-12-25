#!/bin/bash

read n m

base=".|."
base_num=1

base_dots=$(( (m - 3) / 2 ))

for _ in $(seq 1 $(( n / 2 ))); do
	printf -- '-%.0s' $(seq $base_dots)
	for j in $(seq 1 $base_num); do echo -n "$base"; done
        printf -- '-%.0s' $(seq $base_dots)
	echo ""
	((base_dots-=3))
	((base_num+=2))
done

base_dots=$(( (m - 7) / 2 ))
printf -- '-%.0s' $(seq $base_dots)
echo -n "WELCOME"
printf -- '-%.0s' $(seq $base_dots)
echo ""

base_dots=3
base_num=$(( (m - 2*$base_dots) / $base_dots))


for _ in $(seq 1 $(( n / 2 ))); do
	printf -- '-%.0s' $(seq $base_dots)
        for j in $(seq 1 $base_num); do echo -n "$base"; done
        printf -- '-%.0s' $(seq $base_dots)
        echo ""
        ((base_num-=2))
        ((base_dots+=3))
done

