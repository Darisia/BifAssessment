#!/bin/bash

# This script contains the code for the programmes created to answer question Two of the Assessment
# All output files created for this question will be stored in the current working direction as well as printed to standard output

## Question 2 (b)
# tools needed: remote blast
blastp -query $1 -db nr -evalue $2 -out BlastOutput.out
# Pull out the top 10 hits from the output blast file
grep -A 11 "Description" BlastOutput.out | \
sed 's/  /,/g' | \
sed 's/^,,//g' | \
sed 's/,/\t/g' | \
awk '{print $1, $NF}' > BlastOutputTop10.txt # the first ten hits in the file are the top 10 best hits (lowest E-values and highest scores)
cat BlastOutputTop10.txt
