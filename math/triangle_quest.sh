#!/bin/bash

read n

for i in $(seq $(( n - 1 ))); do
	echo $(( (10**i / 9) * i ))
done

