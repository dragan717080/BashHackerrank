#!/bin/bash

read s
echo "$s" | tr 'a-zA-Z' 'A-Za-z' | tr -d '0-9'

