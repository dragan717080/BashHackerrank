#!/bin/bash

read s

count=1
for ((i=0; i<${#s}; i++)); do
        current=${s:i:1}
        previous=${s:i-1:1}
	[[ $i -eq $(( ${#s} - 1 )) ]] && {
		echo -n "($(( count + 1 )), $previous)"
		exit 0
	}
        [[ $current == $previous ]] && ((count+=1)) || {
                echo -n "($count, $previous) "
                count=1
        }
done

