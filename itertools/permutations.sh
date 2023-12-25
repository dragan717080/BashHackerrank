#!/bin/bash

expression='''
from itertools import permutations

s, k = map(lambda item: [c for c in item[1]] if item[0] == 0 else int(item[1]), enumerate(input().split()))
print(*sorted(["".join(comb) for comb in permutations(s, k)]), sep="\n")'''

python -c "eval $expression"

