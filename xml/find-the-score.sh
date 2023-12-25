#!/bin/bash

expression="""
import sys
import xml.etree.ElementTree as etree

def get_attr_number(n):
    return len(n.keys()) + sum(get_attr_number(x) for x in n)

sys.stdin.readline()
xml = sys.stdin.read()
tree = etree.ElementTree(etree.fromstring(xml))
print(get_attr_number(tree.getroot()))"""

python -c "eval $expression"

