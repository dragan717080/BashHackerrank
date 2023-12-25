#!/bin/bash

expression="
_ = int(input())
a = list(map(int, input().split()))

def is_palindromic(d):
    d_str = [c for c in str(d)]
    return all(d_str[i] == d_str[-i -1] for i in range(len(d_str) // 2))

print(all(d > 0 for d in a) and any(is_palindromic(d) for d in a))
"

python -c "$expression"

