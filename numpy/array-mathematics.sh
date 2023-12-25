#!/bin/bash

read n m

read -a a
read -a b

for (( i=0; i<${#a[@]}; i++)); do
	arr+=($(( ${a[$i]} + ${b[$i]} )))
done
echo "[[ ${arr[@]} ]]"
arr=()

for (( i=0; i<${#a[@]}; i++)); do
        arr+=($(( ${a[$i]} - ${b[$i]} )))
done
echo "[[ ${arr[@]} ]]"
arr=()

for (( i=0; i<${#a[@]}; i++)); do
        arr+=($(( ${a[$i]} * ${b[$i]} )))
done
echo "[[ ${arr[@]} ]]"
arr=()

for (( i=0; i<${#a[@]}; i++)); do
        arr+=($(( ${a[$i]} / ${b[$i]} )))
done
echo "[[ ${arr[@]} ]]"
arr=()

for (( i=0; i<${#a[@]}; i++)); do
        arr+=($(( ${a[$i]} % ${b[$i]} )))
done
echo "[[ ${arr[@]} ]]"
arr=()

for (( i=0; i<${#a[@]}; i++)); do
        arr+=($(( ${a[$i]} ** ${b[$i]} )))
done
echo "[[ ${arr[@]} ]]"
arr=()

