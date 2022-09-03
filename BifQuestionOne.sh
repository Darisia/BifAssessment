#!/bin/bash

# This script contains the code for the programmes created to answer question One of the Assessment
# The file needed for this question is ...
# All output files created for this question will be stored in the current working direction as well as printed to standard output

# Programme parses the input file and returns the top 10 hits with their E-value and Description columns

# The input file "hmmsearch.out" is stored in the current working directory
grep -A 11 "Description" ./hmmsearch.out | \
sed 's/  /,/g' | \ # Since the file was separated by a double space - we are replacing it with a comma
sed 's/^,,//g' | \ ## There are two field separators in the beginning of the results table and these need to be removed
sed 's/,/\t/g' | \ ## For all comma field separators - change it to tabs instead (more widely used and easier to interpret)
awk '{print $1, $NF}' > ./hmmsearchTop10.txt # the first ten hits in the file are the top 10 best hits (lowest E-values and highest scores)
cat ./hmmsearchTop10.txt
