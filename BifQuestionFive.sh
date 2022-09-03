#!/bin/bash

# This script contains the code for the programmes created to answer question Five of the Assessment
# All output files created for this question will be stored in the current working direction as well as printed to standard output

## Workflow for the diversity analysis of the given amplicon sequences

# Install required packages (packages listed before) within a created conda environment
# qiime2 All dependcies reqiured for this tool should be installed within the specific conda environment when installing the tool

# Assess the metagenomics.fastq file
# Upon Assessment - this file did not fit fastq file criteria (reads were not the same length)
# Compared an example "unaligned representiave sequence file" from the Qiime2 tutorial page - our metagenomics.fastq file has the same characteristics as this example file
# NB! All input and output files are saved and stored in the current working directory

# Converted the fastq file to a fasta file (using command line file editing)
sed -n '1~4s/^@/>/p;2~4p' metagenomics.fastq > metagenomics.fasta

# Started the qiime2 workflow from the unaligned representiave fasta sequence as input
#convert the metagenomics fasta file to a qiime2 artifact
qiime tools import \
--input-path metagenomics.fasta \
--output-path metagenomicsretry.qza \
--type 'SampleData[Sequences]'

# performed depreplication of sequences
qiime vsearch dereplicate-sequences \
--i-sequences metagenomicsretry.qza \
--o-dereplicated-table table.qza \
--o-dereplicated-sequences rep-seqs.qza
# Export the table to have a look
qiime tools export \
--input-path table.qza \
--output-path ./

biom convert \
-i feature-table biom \
-o feature-table.tsv \
--to-tsv

# Found OTUs (operational Taxonimic units) from the depreplicated file
qiime vsearch cluster-features-de-novo \
--i-table table.qza \
--i-sequences rep-seqs.qza \
--p-perc-identity 0.97 \
--o-clustered-table table-dn-97.qza \
--o-clustered-sequences rep-seqs-dn-97.qza
# Created a feature table - this Qiime2 artifact was converted into a text file and included under the results folder
qiime tools export \
--input-path table-dn-97.qza \
--output-path ./

# Calculated alpha-diversity using the shannon index
# The shannon entropy value was returned (can view undeer results) - low entropy = low diveristy, and vice versa
qiime diversity alpha \
--i-table table-dn-97.qza \
--p-metric 'shannon' \
--o-alpha-diveristy alphaClustDiv.qza

# graphed the information - however, this is not very informative since only one sample was used for analysis
