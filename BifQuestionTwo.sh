#!/bin/bash

# This script contains the code for the programmes created to answer question Two of the Assessment
# All output files created for this question will be stored in the current working direction as well as printed to standard output

## Question 2 (a)
# Programme "FindandCount" searches the input DNA sequence file for a set of patterns and returns the number of times the n-mer exists in the file
# Code to create the function:

cat <DNA_input_file> | awk -F 'abc' '{ print (length > 0 ? NF - 1 : 0) }'
# Multiple lines? multiple n-mers?

## Question 2 (b)
# The programme "BlastandReturn" runs remote bastp on the input protein sequence file and returns the top 10 hits to standard output
# The core code - don't know yet

## Question 2 (c)
# The programme "GraphandVisualise" runs the Rscript to plot the information from the tab file
# Core code - haven't created yet
