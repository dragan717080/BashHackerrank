#!/bin/bash

expression="""
import re

print(*list(filter(lambda s: bool(re.match(r'^<[A-Za-z]\w*([-.\w]+)?@[A-Za-z]+\.[A-Za-z]{1,3}>$', s.split()[1])), [input() for _ in range(int(input()))])), sep='\n')"""

python -c "eval $expression"

