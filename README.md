# QMEE_2026
BIO 708 class repo

# Assignment 1 
For this week's assignment, I will use the output of a blast query of Xenopus laevis coding sequences against Xenopus longipes whole genome (organized in contigs)

The biological relevance of it is that I'd like to explore the gene content from the laevis query of the longipes contigs. This is one of the exploratory methods to help candidate contigs for sex-linkage.

BMB: can you be more specific about "explore"? Which contigs are most interesting? High gene density?

Calculations to perform: The final goal of the computations is to calculate the gene density of the contigs. Several steps are needed to achieve this, including merging the blast output with the full contig lengths. Other metrics on the blast hits were computed for reference in future work.

Code is reproducible using the Assignment_1.R script.

Data files were too large (>300 MB) to upload and instead can be accessed on OneDrive using the following link: https://mcmasteru365-my.sharepoint.com/:f:/g/personal/bsatay_mcmaster_ca/IgAYWpki92rSTba19Oxq0XcwAdYKtdcHXSGgiD6b1uk7c6U?e=kVD4Zg. 
How to use data: 'Data' folder should be placed within the Assignment 1 directory
**BMB:** it's actually 'data' (lowercase 'd'), according to your script

### References:
- https://www.geeksforgeeks.org/r-language/how-to-add-header-to-dataframe-in-r/
- https://www.geeksforgeeks.org/r-language/how-to-split-column-into-multiple-columns-in-r-dataframe/
- https://dplyr.tidyverse.org/reference/filter.html
- https://dplyr.tidyverse.org/reference/summarise.html#:~:text=summarise()%20creates%20a%20new,and%20summarize()%20are%20synonyms.
- https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/merge
- https://r-graph-gallery.com/272-basic-scatterplot-with-ggplot2.html


# Assignment 2
For this assignment, I'll be exploring the output of ANGSD association from mapped pair reads of Xenopus longipes. ANGSD stands for Analysis of Next Generation Sequencing Data
Similar to the previous assignment, the overarching  goal is to identify candidate contigs that could contain sex determining genes.
Specifically, ANGSD association is another yet important approach to do, as it uses genotype likelihoods to perform genetic association. 
For each polymorphic position, the minor allele frequency is computed and the likelihood ratio statisitc (LRT) and Pvalue is also generated.
From this information, other paramaeters such as SNP density or the Negatie Log(P) will be computer to to distinguish candidate contigs and prepare the data for future exploration.

### How to find the script 
script_1.R contains data examination and data cleaning 
script_2.R contains computations more relevant to the biological question
Note: run script_1.R prior to script_2.R


### Future work
The next steps would be 'annotating' the candidate contigs and using the X.laevis genome (specifically the blast output from Assignment 1) to highlight what genes they contain

### References: 
- https://www.popgen.dk/angsd/index.php/Association
- https://www.datacamp.com/tutorial/make-histogram-basic-r
- https://www.datacamp.com/doc/r/subset



