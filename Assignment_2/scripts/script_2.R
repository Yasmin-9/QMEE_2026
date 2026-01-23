library(dplyr)
library(skimr)
library(ggplot2)

# Read the merged_df object
df_merged <- readRDS("df_merged.rds")

# Compute the density  (lengths are in bases)
df_merged$Density_Mb <- df_merged$SNP_count / (df_merged$Length / 1e6)
# see next steps 

# Read the SNP_metrics_df object 
SNP_metrics_df <- readRDS("SNP_metrics_df.rds")

# Calculate the -log(P) from the SNP_metrics_df 
# this will allow better visualization of SNP significance 
SNP_metrics_df <- mutate(SNP_metrics_df, Neg_log_P = -log10(P))
skim(SNP_metrics_df)

# Plot the distribution of the -log(P) to potentially help determine a threshold cutoff of significant SNPs
print(ggplot(SNP_metrics_df, aes(x=Neg_log_P))
      + geom_histogram()
)
# from the histogram, I'm unable to discern a good cut off value 
# but we know from the skim(SNP_metrics_df) that the max value of Neg_log_P is 6.63
# so, an appropriate threshold would be 5 

## JD: Can you explain a bit more?

# Extract the SNPs with -log(P) above the threshold = 5 - these will be considered 'significant SNPs' 
Sig_SNP_df <- SNP_metrics_df[which(SNP_metrics_df$Neg_log_P > 5), ]
skim(Sig_SNP_df)

# Next steps would be: 
# - Exploring the SNP density of contigs by ranking them
# - Exploring contigs with high SNP density and their Neg_log_P values 
# - Explore the distribution of the Sig_SNPs across contigs (i.e. do they aggregate one a certain contig): 
#       - At the moment, the Sig_SNP_df shows 30 SNPs across 22 contigs 

## JD: All seems sensible, grade 2/3
