#!/bin/bash

read n

declare -A arr

for _ in $(seq $n); do read country; arr[$country]=1; done;
echo ${#arr[@]}

