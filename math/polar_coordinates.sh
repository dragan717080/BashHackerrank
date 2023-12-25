#!/bin/bash

expression="""
from cmath import phase
from math import sqrt

z = complex(input())

print(f'{sqrt(z.real**2 + z.imag**2)}\n{phase(z)}')"""

python -c "eval $expression"

