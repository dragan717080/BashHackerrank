#!/bin/bash

read s

sorted_s=$(echo "$s" | grep -o '[[:lower:]]' | sort | tr -d '\n')
sorted_s+=$(echo "$s" | grep -o '[[:upper:]]' | sort | tr -d '\n')
sorted_s+=$(echo "$s" | grep -o '[[:digit:]]' | grep -e '[13579]' | sort | tr -d '\n')
sorted_s+=$(echo "$s" | grep -o '[[:digit:]]' | grep -e '[02468]' | sort | tr -d '\n')

echo "$sorted_s"

