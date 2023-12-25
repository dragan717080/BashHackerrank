#!/bin/bash

read n

for i in $(seq 0 $(( n - 1 ))); do echo $(( i * i )); done;

