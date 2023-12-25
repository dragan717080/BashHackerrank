#!/bin/bash

read _

declare -a a
declare -a b

read -a arr

for element in "${arr[@]}"; do
    [[ -v a["$element"] ]] && b["$element"]=1 || a["$element"]=1
done

for k in "${!a[@]}"; do
	[[ -v b["$k"] ]] || echo "$k"
done

