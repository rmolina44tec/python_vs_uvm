#!/usr/bin/env python3
import sys
import array
import struct

# make stdin binary
file = sys.stdin.detach()

# read size
size_format = 'N' # size_t
n, = struct.unpack(size_format, file.read(struct.calcsize(size_format)))
print(n)

a = array.array('h') # native short int
a.fromfile(file, n)
print(a.tolist()) # -> [31415, 9265, 3589, 793]




# def greet(name):
#     "Greet somebody (in Python)."
#     print "Hello", name
