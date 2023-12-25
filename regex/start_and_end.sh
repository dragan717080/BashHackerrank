#!/bin/bash

expression="""
import re

s, q = input(), input()
if bool(re.search(q, s)):
    matches = re.finditer(fr'(?={q})', s)
    for m in matches:
        print(f'({m.start()}, {m.start() + len(q) - 1})')
else:
    print((-1, -1))
"""

python -c "eval $expression"

