#!/bin/bash

expression="""
import re

print(*(re.sub(r'(?<=\s)\|\|(?=\s)', 'or', re.sub(r'(?<=\s)&&(?=\s)', 'and', input())) for _ in range(int(input()))), sep="\n")"""

python -c "eval $expression"

