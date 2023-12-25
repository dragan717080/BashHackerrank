#!/bin/bash

expression="""
import re

rows, cols = map(int, input().strip().split())
matrix = [input() for _ in range(rows)]

transposed = ''.join(item for sublist in list(zip(*matrix)) for item in sublist)
print(re.sub(r'(?<=[a-zA-Z0-9])[^a-zA-Z0-9]+(?=[a-zA-Z0-9])', ' ', transposed))"""

python -c "eval $expression"

