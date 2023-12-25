#!/bin/bash

expression="""
import itertools

def f(x):
    return x**2
    
k, m = map(int, input().split(' '))
lists = []
for _ in range(k):
    lists.append(list(map(int, input().split(' ')[1:])))

r = max(sum(map(f, t)) % m for t in itertools.product(*lists))
print(r)"""

python -c "eval $expression"

