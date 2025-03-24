# load required libraries
library(phyloseq)
library(ggplot2)
library(dplyr)
install.packages("BiocManager")  # If BiocManager is not installed
BiocManager::install("microbiome")
library(microbiome)
install.packages("indicspecies")  
library(indicspecies)

# read in phyloseq object
load("physeq_object_new.RData")

# create subsets for nitrogen
physeq_high_nitrogen <- subset_samples(physeq, total_nitrogen_percent == "high")
physeq_low_nitrogen <- subset_samples(physeq, total_nitrogen_percent == "low")

# core microbiome analysis - 80% prevalence
core_high <- core_members(physeq_high_nitrogen, detection = 0.001, prevalence = 0.8)
core_low <- core_members(physeq_low_nitrogen, detection = 0.001, prevalence = 0.8)

# Find shared and unique taxa
shared_core <- intersect(core_high, core_low)
unique_high <- setdiff(core_high, core_low)
unique_low <- setdiff(core_low, core_high)

# Print results
length(shared_core)  # Number of shared core taxa
# 0
length(unique_high)  # Unique to high nitrogen samples
# 1
length(unique_low)   # Unique to low nitrogen samples
# 41

# Create bar plot to visualize core microbiome analysis 

# Create a data frame for the bar plot
core_taxa_df <- data.frame(
  Category = c("Shared Core", "Unique to High Nitrogen", "Unique to Low Nitrogen"),
  Count = c(length(shared_core), length(unique_high), length(unique_low))
)

# Plot using ggplot2
library(ggplot2)

ggplot(core_taxa_df, aes(x = Category, y = Count, fill = Category)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Core Microbiome Analysis: Taxa Distribution",
       x = "Category",
       y = "Number of Taxa") +
  scale_fill_manual(values = c("blue", "green", "red")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Core microbiome analysis - 70% prevalence
core_high_70 <- core_members(physeq_high_nitrogen, detection = 0.001, prevalence = 0.7)
core_low_70 <- core_members(physeq_low_nitrogen, detection = 0.001, prevalence = 0.7)

# Find shared and unique taxa for 70% prevalence
shared_core_70 <- intersect(core_high_70, core_low_70)
unique_high_70 <- setdiff(core_high_70, core_low_70)
unique_low_70 <- setdiff(core_low_70, core_high_70)

# Print results for 70% prevalence
length(shared_core_70)  # Number of shared core taxa
# 2
length(unique_high_70)  # Unique to high nitrogen samples
# 17
length(unique_low_70)   # Unique to low nitrogen samples
# 87

# Create a data frame for the bar plot with 70% prevalence
core_taxa_df_70 <- data.frame(
  Category = c("Shared Core", "Unique to High Nitrogen", "Unique to Low Nitrogen"),
  Count = c(length(shared_core_70), length(unique_high_70), length(unique_low_70))
)

# Plot using ggplot2
ggplot(core_taxa_df_70, aes(x = Category, y = Count, fill = Category)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Core Microbiome Analysis: Taxa Distribution (70% Prevalence)",
       x = "Category",
       y = "Number of Taxa") +
  scale_fill_manual(values = c("blue", "green", "red")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Indicator species analysis 

# First transpose OTU table so you have 192 rows (same as sample metadata)
otu_df <- t(otu_df)  # Transpose the OTU table so samples are in rows

# Check sample names in OTU table
otu_sample_names <- rownames(otu_df)
cat("Sample names in OTU table:\n", head(otu_sample_names), "\n")

# Check sample names in sample metadata
grouping_sample_names <- rownames(sample_metadata)
cat("Sample names in sample metadata:\n", head(grouping_sample_names), "\n")

# Compare the sample names
setdiff(otu_sample_names, grouping_sample_names)  # Samples in OTU table but not in grouping

# Sample names are all good - keep going

# Subset data based on common samples
common_samples <- intersect(otu_sample_names, grouping_sample_names)
cat("Number of common samples:", length(common_samples), "\n")

# Subset both the OTU table and sample metadata to keep only common samples
otu_df <- otu_df[common_samples, ]
grouping <- grouping[common_samples]

# Check dimensions after subsetting
cat("Number of samples in OTU table after subsetting:", nrow(otu_df), "\n")
cat("Number of samples in grouping vector after subsetting:", length(grouping), "\n")

# Extract the nitrogen percentage data from sample metadata
grouping <- sample_metadata$total_nitrogen_percent 

# Check the first few values of the grouping vector
head(grouping)

# Ensure that the grouping variable is a factor
grouping <- factor(grouping)

# Check the levels of the grouping factor
levels(grouping)

# Perform Indicator Species Analysis using 'multipatt' from the 'indicspecies' package
indicator_result <- multipatt(otu_df, grouping, func = "IndVal", control = how(nperm = 100))

# View the results
summary(indicator_result)

# Filter for significant species based on p-value < 0.05
significant_species <- indicator_result$sign[indicator_result$sign$p.value < 0.05, ]

# View the significant species
head(significant_species)

# Clean data before interpreting

# Remove rows with NA values
significant_species_clean <- na.omit(significant_species)

# View the cleaned data
head(significant_species_clean)

# Species indicative of high nitrogen
high_indicator_species <- significant_species_clean[significant_species_clean$index == 1, ]

# Species indicative of low nitrogen
low_indicator_species <- significant_species_clean[significant_species_clean$index == 2, ]

# View the species for each group
head(high_indicator_species)
head(low_indicator_species)

# Visualize 

# Combine both high and low indicator species for visualization
high_indicator_species$Group <- "High Nitrogen"
low_indicator_species$Group <- "Low Nitrogen"

# Combine the two datasets
indicator_species <- rbind(high_indicator_species, low_indicator_species)

# Plot test statistics for high and low nitrogen species
ggplot(indicator_species, aes(x = stat, fill = Group)) +
  geom_histogram(binwidth = 0.05, color = "black", alpha = 0.7) +
  facet_wrap(~Group) +
  theme_minimal() +
  labs(title = "Distribution of Test Statistics for Indicator Species",
       x = "Test Statistic",
       y = "Count")
