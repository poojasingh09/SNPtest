#!/bin/bash

#SBATCH -n 1 # one CPU
#SBATCH -N 1 # on one node
#SBATCH --time=120:00:00 # Running time of 2 hours
#SBATCH --mem 4000 # Memory request
#SBATCH --mail-user=pooja.singh1@ucalgary.ca
#SBATCH --mail-type=BEGIN,END,FAIL

module load samtools
module load bcftools
module load vcftools


### run bcftool on all bam files cohort

bcftools mpileup -I -B -f /home/psingh/projects/def-yeaman/CoAdepTree/database/Pita2_stitched_2/pita2_stitch_v2.fa *.bam -a "DP,AD" > all.mpileup

sacct --format="CPUTime,MaxRSS,AveRSS,JobName,Timelimit,Start,Elapsed" > all.jobinfo1

### run bcftools on all bam mpileup

bcftools call -Ov -mv -f GQ all.mpileup2 --samples-file ploidy > all.raw.vcf2

sacct --format="CPUTime,MaxRSS,AveRSS,JobName,Timelimit,Start,Elapsed" > all.jobinfo2

###filt for baseline parameters DP > 5; GQ > 20 and snps called in at least 10 individuals

vcftools --vcf all.raw.vcf2 \
	--minGQ 20 \
	--minDP 5 \
	--mac 10 \
	--recode \
	--stdout > /home/psingh/projects/def-yeaman/psingh/snptest/realigned/all.filt.vcf2.vcftools

### extract genotype information for genotype table and downstream analysis

vcftools --vcf all.filt.vcf2.vcftools --extract-FORMAT-info GT --out all.filt.vcf2.vcftools.GT
