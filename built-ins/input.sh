#!/bin/bash

read x k

read p

result=$(echo "$p" | sed "s/x/$x/g")
result=$(( result ))
[[ "$result" -eq $k ]] && echo "True" || echo "False"

