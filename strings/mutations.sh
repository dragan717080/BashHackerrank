#!/bin/bash

read s

read pos c

s="${s:0:$pos}$c${s:$(($pos + 1))}"
echo $s
