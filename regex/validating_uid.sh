#!/bin/bash

expression="""
from html.parser import HTMLParser

class MyHTMLParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        print(tag)
        [print(f'-> {attr[0]} > {attr[1]}', end='\n') for attr in attrs]

MyHTMLParser().feed(''.join([input() for _ in range(int(input()))]))"""

python -c "eval $expression"

