#!/bin/bash

read n

if (( n % 2 != 0 )); then echo 'Weird'
else
	if (( n < 6 || n > 20)); then echo 'Not Weird'; else echo 'Weird'; fi
fi

