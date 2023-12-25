#!/bin/bash

read a
read b
read m

res=$(( a ** b ))
echo -e "$res\n$(( res % m ))"

