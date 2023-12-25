#!/bin/bash

expression="""
from html.parser import HTMLParser

class MyHTMLParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        print(f'Start : {tag}' + ''.join([f'\n-> {attr[0]} > {attr[1]}' for attr in attrs if attrs]))

    def handle_endtag(self, tag):
        print(f'End   : {tag}')

    def handle_startendtag(self, tag, attrs):
        print(f'Empty : {tag}' + ''.join([f'\n-> {attr[0]} > {attr[1]}' for attr in attrs if attrs]))

MyHTMLParser().feed(''.join([input() for _ in range(int(input()))]))"""

python -c "eval $expression"

