#!/bin/bash

expression="""
import re

[print(bool(re.search('^[+-]?\d*\.\d+$', input()))) for _ in range(int(input()))]"""
python -c "eval $expression" 2>/dev/null

