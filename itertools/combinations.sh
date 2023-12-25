#!/bin/bash

expression='''
from itertools import combinations

s, k = map(lambda item: [c for c in item[1]] if item[0] == 0 else int(item[1]), enumerate(input().split()))
print("\n".join([item for sublist in list((sorted(["".join(sorted(comb)) for comb in combinations(s, i)])) for i in range(1, k + 1)) for item in sublist]))'''

python -c "eval $expression"

