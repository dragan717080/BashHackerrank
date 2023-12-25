#!/bin/bash

expression="""
import numpy as np

matrix = np.array([list(map(int, input().split())) for _ in range(list(map(int, input().split()))[0])])
print(f'{np.mean(matrix, axis=1)}\n{np.var(matrix, axis=0)}\n{round(np.std(matrix), 11)}')"""

pip install numpy; python -c "eval $expression"

