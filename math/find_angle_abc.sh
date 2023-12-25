#!/bin/bash

expression="""
from math import sqrt, asin, degrees

ab, bc = int(input()), int(input())
ac = sqrt(ab**2 + bc**2)

print(f'{round(degrees(asin(ab / ac)))}{chr(176)}')"""

python -c "eval $expression"

