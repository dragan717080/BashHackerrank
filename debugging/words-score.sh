#!/bin/bash

read n

read -a a

vowels=(a e i o u y)

count=0
for word in ${a[@]}; do
	word_vowel_count=0
	for char in $(echo "$word" | grep -o .); do
		printf '%s\0' "${vowels[@]}" | grep -Fxqz -- "$char" &&	((word_vowel_count+=1))
	done
	(( $word_vowel_count % 2 == 0 )) && { 
		((count+=2)) 
} || ((count+=1))
done

echo $count

