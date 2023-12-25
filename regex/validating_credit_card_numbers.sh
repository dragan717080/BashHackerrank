#!/bin/bash

expression="""
import re

print(*list('Valid' if bool(re.match(r'(?!.*(\d)(?:-?\1){3})^[4|5|6]\d{3}(?:-?\d{4}){3}$', input())) else 'Invalid' for _ in range(int(input()))), sep='\n')"""

python -c "eval $expression"

