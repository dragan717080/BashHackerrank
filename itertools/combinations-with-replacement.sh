#!/bin/bash

expression='''
from itertools import combinations_with_replacement

s, k = map(lambda item: [c for c in item[1]] if item[0] == 0 else int(item[1]), enumerate(input().split()))
print("\n".join(list(sorted(["".join(sorted(comb)) for comb in combinations_with_replacement(s, k)]))))'''

python -c "eval $expression"

