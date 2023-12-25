#!/bin/bash

read s

IFS='.,'; read -a arr <<< "$s"; unset IFS;
printf "%s\n" ${arr[@]}

