#!/bin/bash

expression="""
import re

print(*(i for i in re.compile(r'#[0-9A-Fa-f]{6}(?=[;,)])|#[0-9A-Fa-f]{3}(?=[;,)])').findall('\n'.join([input() for _ in range(int(input()))]))), sep='\n')"""

python -c "eval $expression"

