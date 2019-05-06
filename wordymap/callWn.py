#!/usr/bin/env python3
import sys
import os
import pathlib
from subprocess import Popen # Run cannot be used in rhel 7 due to python 3.4

def main():
    if len(sys.argv) != 3:
        print("error: improper number of args", len(sys.argv))
    print(os.getcwd())
    docPath = pathlib.Path.home().joinpath("/Documents/temp/")
    os.makedirs(docPath)
    docPath = docPath.joinpath("/output.txt")
#    output = open(docPath, "w+")
    output = ""
    Popen(['wn', sys.argv[1], '-synsn'], stdout=output).communicate()[0]
#    output = open("/temp/output.txt", "r")
#    print(output.read())
    print(output)

if __name__ == "__main__":
    main()

