#!/bin/bash

expression="""
class EvenStream(object):
    def __init__(self):
        self.current = 0

    def get_next(self):
        to_return = self.current
        self.current += 2
        return to_return

class OddStream(object):
    def __init__(self):
        self.current = 1

    def get_next(self):
        to_return = self.current
        self.current += 2
        return to_return

def print_from_stream(n, stream=EvenStream()):
    stream.current = stream.current % 2
    [print(stream.get_next()) for _ in range(n)]

for _ in range(int(input())):
    stream_name, n = map(lambda item: item[1] if item[0] == 0 else int(item[1]), enumerate(input().split()))
    print_from_stream(n) if stream_name == 'even' else print_from_stream(n, OddStream())"""

python -c "eval $expression"

