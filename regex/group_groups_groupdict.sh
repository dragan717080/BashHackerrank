#!/bin/bash

expression="""
import re
pattern = re.compile(r'([A-Za-z0-9])(\1)')
s = input()
print(pattern.search(s).group(1) if pattern.search(s) else -1)"""

python -c "eval $expression"

