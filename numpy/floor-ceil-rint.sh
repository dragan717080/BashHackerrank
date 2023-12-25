#!/bin/bash

read -a a
declare -A nums

for (( i=1; i <=${#a[@]}; i++ )); do
	IFS='.'; read num remainder <<< "${a[$(( i - 1 ))]}"
	floors+=($num)
	[[ $remainder != "" ]] && {
		ceils+=($(( num + 1 )))
			[[ $remainder -gt 5 ]] && rints+=($(( num + 1 ))) || rints+=($num)
	} || {
		ceils+=($num)
		rints+=($num)
	}
done

echo "[ $(printf '%s. ' ${floors[@]})]"
echo "[ $(printf '%s. ' ${ceils[@]})]"
echo "[ $(printf '%s. ' ${rints[@]})]"

