library(dplyr)
library(skimr)

# Load the angsd assoc output file (unfiltered)
file = "Assignment 2/data/out_additive_F1.lrt0"
system.time(df <- read.delim(file, header = TRUE)) 

# Check the df summary and data types 
summary(df)

# Convert any necessary data types 
# All data types were assigned appropriately. 

# Clean of NAs 
count(df,is.na(df))
# no missing values in the first place 


# Filter out any Frequency < 0.1
clean_df <- filter(df, Frequency >= 0.1)
n_distinct(clean_df)
# the number of entries was reduced from 553815 to 252763


# Could possibly create a subset table with Position, Major, and Minor 
# Confirm all 'Positions' are unique 
skim(clean_df)
# since the no. of distinct rows =! no. of distinct positions, 'Position' is not unique and 
# therefore a subset table of Position, Major, and Minor would not contain enough information
# this is because 'Position' refers to position within the contig and not within the genome (since the contigs are not ordered)  
# therefore, such a subset table should also contain Chromosome datatype 


# Subset the dataframe with a subset table that contains SNP positions, major, and minor alleles
SNP_info_df <- clean_df[, c('Chromosome', 'Position', 'Major', 'Minor')]
SNP_metrics_df <- clean_df[, c('Chromosome', 'Frequency', 'LRT', 'P')]
# the reasoning is that SNP_info_df is not needed at the moment and instead of dropping the columns, they were subsetted into a separate dataframe 
# SNP_metrics_df is what will be used at the moment 

# Sanity check: both dataframes should be the same length
nrow(clean_df)
nrow(SNP_info_df)
nrow(SNP_metrics_df)
# all dataframes have the same length

# Save the two subset dataframes into rds object
saveRDS(SNP_info_df, "SNP_info_df.rds")
saveRDS(SNP_metrics_df, "SNP_metrics_df.rds")
# if clean_df is needed, it can can be obtained again by merging the two

# Calculate the SNP count in a separate column 
(SNP_count <- SNP_metrics_df
              %>% group_by(Chromosome)
              %>% summarize(SNP_count = n())
                )

# Import the contig length file 
bed_file = "Assignment 2/data/contig_length.bed"
contig_length = read.delim(bed_file, header = FALSE, quote = "", stringsAsFactors = FALSE, skip =1)
colnames(contig_length) = c("Chromosome", "Length")

# Merge into the SNP_count
df_merged <- merge(SNP_count, contig_length, by= "Chromosome", all.x=TRUE)

# Sanity check 
nrow(df_merged)
n_distinct(df_merged)
# all rows in df_merged are distinct indeed


# Save the df_merged as a an r object that can be referenced in the second script
saveRDS(df_merged, "df_merged.rds")




