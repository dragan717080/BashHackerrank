#!/bin/bash

read r1 i1
read r2 i2

get_res () {
	local r1=$1
	local r2=$2
	local i1=$3
	local i2=$4
	local operator=$5
	real_res="$(( r1 $operator r2 ))"
	res="$(( i1 $operator i2 ))"
	(( $res > 0 )) && sign=+ || sign=
	printf "%.2f%s%.2fi\n" "$(( $real_res ))" "$sign" "$res"
}

mul () {
	local r1=$1
	local r2=$2
	local i1=$3
	local i2=$4
	r=$(( r1 * r2 - i1 * i2 ))
	i=$(( r1 * i2 + r2 * i1 ))
	printf "%.2f+%.2fi\n" $r $i
}

div () {
	local r1=$1
	local r2=$2
	local i1=$3
	local i2=$4
	numerator1=$(( r1 * r2 + i1 * i2 ))
	numerator2=$(( i1 * r2 - r1 * i2 ))
	denominator=$(awk -v a="$r2" -v b="$i2" 'BEGIN { printf "%.2f", (a^2 + b^2) } ')
	r=$(awk -v a="$numerator1" -v b="$denominator" 'BEGIN { printf "%.2f", a / b } ')
	i=$(awk -v a="$numerator2" -v b="$denominator" 'BEGIN { printf "%.2f", a / b } ')
	printf "$r$i\n"
}

true

mod () {
	local r1=$1
	local i1=$2
	mod=$(awk -v a="$r1" -v b="$i1" 'BEGIN { printf "%.2f", ( sqrt(a^2 + b^2) ) } ')
	printf "%.2f+0.00i\n" $mod
}

get_res "$r1" "$r2" "$i1" "$i2" "+"
get_res "$r1" "$r2" "$i1" "$i2" "-"
mul "$r1" "$r2" "$i1" "$i2"
div "$r1" "$r2" "$i1" "$i2"
mod "$r1" "$i1"
mod "$r2" "$i2"

