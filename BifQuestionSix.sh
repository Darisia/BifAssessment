#!/bin/bash

## Workflow for the analysis of metagenomic data from shotgun sequencing

## NB! Problem downloading the shotgun sequencing files due to internet and space issues so this question could not be fully completed
## However, Please see below for the steps of the workflow if I could have downloaded the files

# Install required packages (packages listed before) within a created conda environment
# megahit All dependcies reqiured for this tool should be installed within the specific conda environment when installing the tool
# metaBat
# Bowtie2
# checkm

## Sequence quality control and trimming if neccessary

## Prior to input into the megahit tool:
# All read 1 files would have been concatenated into a single read 1 file and the same would have been done for read 2

## Metagenome assembly with megahit
megahit \
-1 path/to/fastqCombined_R1.fastq.gz \
-2 path/to/fastqCombined_R2.fastq.gz \
-o MetaAssembly/

## Read binning, with metaBat, to identify contigs from the same scaffold and potentially the same organism
bowtie2-build final.contigs.fa final.contigs
# Align the reads back to the contigs to ID read depth and additional binning information
bowtie2 -x final.contigs \
-1 path/to/fastqCombined_R1.fastq.gz \
-2 path/to/fastqCombined_R2.fastq.gz \
-o Aligned.bam
# Sort the alignemnt file (BAM) with samtools
samtools sort Aligned.bam \
-o Sorted.bam
# Run metaBat to actually Bin the reads
runMetaBat.sh final.contigs.fa Sorted.bam

## Check the quality of the binned reads and draft genomes
sudo checkm data setRoot ~/.local/data/checkm
checkm lineage_wf -x fa metabat checkm/

# What we looking for here: Over 70% Completion and less than 10% Contamination is generally said to be good draft genomes for downstream analyses
