#!/bin/bash

# This script contains the code for the programmes created to answer question Two of the Assessment
# All output files created for this question will be stored in the directory specified by user (by me - for this question)

## Workflow for the assembly of the given bacterial genome sequence files

# Install required packages (packages listed before) within a created conda environment
# unicycler All dependcies reqiured for this tool should be installed within the specific conda environment when installing the tool
# bowtie2

## Code run from the command line to assemble this bacterial genome
# Note: Sequence files downloaded and stored in "~/Downloads/"
unicycler -1 MiSeq_Ecoli_MG1655_50x_R1.fastq \
-2 MiSeq_Ecoli_MG1655_50x_R1.fastq \
-o assembly/ \
--verbosity 2
# All output files will be stored in the created "assembly" folder within my current working environment

## Additional notes
# A basic bacterial genome assembly was run here - with all default parameters and no changes to any advanced parameters
# Best practice would have been to perform fastqc (sequence quality control) to assess the quality of reads and to trim (with trimmomatic) as needed
# How the fastqc would have been analysed:
  # After running fastqc - since we have two reads (paired-end), multiQC would have been run to aggregate the fastqc results
  # The main metric here would be the per-base sequence quality (using phred scores) and per-sequence quality
