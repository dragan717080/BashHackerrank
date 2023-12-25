#!/bin/bash

read _

read -a s

read n

for _ in $(seq 1 $n); do
	read command command_element <<< "$(read -a arr && echo "${arr[@]}")"
	if [[ ${command:0:1} == "d" ]]; then
		index=0
		for element in ${s[@]}; do
			if [[ ${s[$index]} == $command_element ]]; then
				s=("${s[@]:0:$(( index ))}" "${s[@]:$(( index + 1))}")
				break
			fi
			((index++))
		done
	fi
	if [[ ${command:0:1} == "r" ]]; then
		index=0
		found=false;
		for element in ${s[@]}; do
			if [[ ${s[$index]} == $command_element ]]; then
                                s=("${s[@]:0:$(( index ))}" "${s[@]:$(( index + 1))}")
                        	found=true
				break
			fi
                        ((index++))
		done
		[[ $index -ge ${#s[@]} && "$found" = false ]] && {
			echo "Element doesn't exist"
			exit 1
		}
	fi
	if [[ ${command:0:1} == "p" ]]; then
		s=("${s[@]:1:$(( ${#s[@]} - 1 ))}")
	fi
done

echo ${s[@]}

