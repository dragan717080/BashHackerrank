#!/bin/bash

expression="""
from html.parser import HTMLParser

class MyHTMLParser(HTMLParser):
    def handle_comment(self, data):
        print('>>> Multi-line Comment' if '\n' in data else '>>> Single-line Comment')
        print(data)

    def handle_data(self, data):
        if data != '\n':
            print(f'>>> Data\n{data}')

MyHTMLParser().feed('\n'.join([input() for _ in range(int(input()))]))"""

python -c "eval $expression"

