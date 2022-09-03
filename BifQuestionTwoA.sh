#!/bin/bash

# This script contains the code for the programmes created to answer question Two of the Assessment
# All output files created for this question will be stored in the current working direction as well as printed to standard output

## Question 2 (a)
# Programme searches the input DNA sequence file for a set of patterns and returns the number of times the n-mer exists in the file
for kmer in $2
do
  cat $1 | awk -F $kmer '{ print (length > 0 ? NF - 1 : 0) }' >> ./kmerFind.output
done
cat ./kmerFind.output

# Call the script - the DNA sequence file will be read in as argument one and argument two will be the kmers to search - see example below:
# In terminal:  sh ./BifQuestionTwoA.sh DNASequence.file "kmer1 kmer2 kmer3"
# The output file with the number of each kmer will be saved to the current working directy as ./kmerFind.output
