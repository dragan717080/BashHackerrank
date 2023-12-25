#!/bin/bash

read n
read

s=''
for _ in {1..19}; do
	s+=$(shuf -i 0-9 -n 1)
done

echo $s

