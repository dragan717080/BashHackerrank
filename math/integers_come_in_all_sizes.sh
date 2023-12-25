#!/bin/bash

expression="""
a, b, c, d = (int(input()) for _ in range(4))

print(a**b + c**d)"""

python -c "eval $expression"

