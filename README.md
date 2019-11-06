# SNPtest project (Yeaman Lab)
# Pooja Singh October 2019
SNP calling samtools pipeline that forms part of a larger project to compare various SNP calling algorithms

### input data ###
Haploid megagametophyte sequencing data from 106 Lodgepole pine progeny
Diploid data from mother of the 106 progeny


### aim ###
Compare efficieny of SNPs called from SAMtools, GATK, varscan and FreeBayes
This is only the samtools (bcftools) part
NB: samtools mpileup to call SNPs is deprecated, thus we use bcftools mpileup
NB: samtools mpileup is still fine to direct to tools like varscan etc


### server ###
all analyses were run the Graham server of compute canada
slurm submisison manager was used


### analysis ###
bcftools (samtools) was used to call SNPs and vcftools was used to filter SNPs with basic filters, more stringent filters
can be also implemented as required

sbatch script contains all the steps



