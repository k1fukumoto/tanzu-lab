#!/usr/bin/python
import sys
import re
import os

for line in sys.stdin:
  l=re.sub('KEY=.*$',"KEY='{}'".format(os.environ['RSAKEY']),line)
  if l:
    print (l.rstrip())
  else:
    print (line.rstrip())


