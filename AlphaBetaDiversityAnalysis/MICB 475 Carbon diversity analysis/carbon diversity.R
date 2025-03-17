library(phyloseq)
library(vegan)
library(ggplot2)

# Manually loaded phyloseq object 

# Add tree
tree <- read_tree("tree.nwk")

# Step 1: Remove chloroplasts and mitochondria sequences
physeq_filtered <- subset_taxa(physeq, 
                               !(Taxon %in% c("Chloroplast", "Mitochondria")))

physeq_filtered <- merge_phyloseq(physeq_filtered, tree)

# Step 2: Calculate alpha diversity (Shannon entropy, Observed species, Chao1)
alpha_div <- estimate_richness(physeq_filtered, measures = c("Shannon", "Chao1", "Observed"))

# Step 3: Remove samples with NA Shannon entropy values
alpha_div_filtered <- alpha_div[!is.na(alpha_div$Shannon), ]

# Merge alpha diversity with metadata
metadata <- data.frame(sample_data(physeq_filtered))  # Convert metadata to dataframe
alpha_div$SampleID <- rownames(alpha_div)  # Add SampleID for merging
metadata$SampleID <- rownames(metadata)  # Add SampleID to metadata
alpha_div <- merge(alpha_div, metadata, by = "SampleID")

# Step 4: Perform ANOVA and plot Shannon diversity
# Ensure total_carbon_percent is a factor
alpha_div$total_carbon_percent <- as.factor(alpha_div$total_carbon_percent)

# Perform ANOVA to compare Shannon diversity between groups
anova_result <- aov(Shannon ~ total_carbon_percent, data = alpha_div)
p_value <- summary(anova_result)[[1]]$`Pr(>F)`[1]

# Plot Shannon diversity
ggplot(alpha_div, aes(x = total_carbon_percent, y = Shannon, fill = total_carbon_percent)) + 
  geom_boxplot() + 
  theme_minimal() + 
  labs(title = "Shannon Diversity by Carbon Levels", 
       x = "Total Carbon Percent Category", 
       y = "Shannon Diversity") + 
  geom_text(x = 1.5, y = max(alpha_div$Shannon) - 2, 
            label = paste("p-value =", round(p_value, 3)), size = 5)

# Step 5: Perform ANOVA and plot Observed species
anova_result <- aov(Observed ~ total_carbon_percent, data = alpha_div)
p_value <- summary(anova_result)[[1]]$`Pr(>F)`[1]

# Create the Observed species plot with p-value annotation
ggplot(alpha_div, aes(x = total_carbon_percent, y = Observed, fill = total_carbon_percent)) + 
  geom_boxplot() + 
  theme_minimal() + 
  labs(title = "Observed Species by Carbon Levels", 
       x = "Total Carbon Percent Category", 
       y = "Observed Species") + 
  geom_text(x = 1.5, y = max(alpha_div$Observed) - 0.5, 
            label = paste("p-value =", round(p_value, 3)), size = 5)

# Step 6: Perform ANOVA and plot Chao1 index
chao1_data <- estimate_richness(physeq_filtered, measures = "Chao1")
chao1_data$group <- sample_data(physeq_filtered)$total_carbon_percent

anova_result <- aov(Chao1 ~ group, data = chao1_data)
p_value <- summary(anova_result)[[1]]$`Pr(>F)`[1]

# Create the Chao1 index plot with p-value annotation
ggplot(chao1_data, aes(x = group, y = Chao1, fill = group)) + 
  geom_boxplot() + 
  theme_minimal() + 
  labs(title = "Chao1 Diversity by Carbon Levels", 
       x = "Total Carbon Percent Category", 
       y = "Chao1 Index") + 
  geom_text(x = 1.5, y = max(chao1_data$Chao1) - 0.5, 
            label = paste("p-value =", round(p_value, 3)), size = 5)

# UNIFRAC

# Calculate Weighted UniFrac distance matrix
weighted_unifrac <- distance(physeq_filtered, method = "unifrac", weighted = TRUE)

# Calculate Unweighted UniFrac distance matrix
unweighted_unifrac <- distance(physeq_filtered, method = "unifrac", weighted = FALSE)

# Convert sample data to a data frame for PERMANOVA
sample_metadata <- as(sample_data(physeq_filtered), "data.frame")
sample_metadata$total_carbon_percent <- as.factor(sample_metadata$total_carbon_percent)

# Perform PERMANOVA for Weighted UniFrac
permanova_weighted <- adonis2(weighted_unifrac ~ total_carbon_percent, data = sample_metadata)

# Perform PERMANOVA for Unweighted UniFrac
permanova_unweighted <- adonis2(unweighted_unifrac ~ total_carbon_percent, data = sample_metadata)

# Extract p-values for both analyses
p_value_weighted <- permanova_weighted$`Pr(>F)`[1]
p_value_unweighted <- permanova_unweighted$`Pr(>F)`[1]

# Perform PCoA for Weighted UniFrac
pcoa_weighted <- ordinate(physeq_filtered, method = "PCoA", distance = weighted_unifrac)

# Perform PCoA for Unweighted UniFrac
pcoa_unweighted <- ordinate(physeq_filtered, method = "PCoA", distance = unweighted_unifrac)

# Weighted plot

# Extract PCoA coordinates for the first two axes (PCoA1, PCoA2)
pcoa_coords_weighted <- data.frame(
  SampleID = rownames(pcoa_weighted$vectors),  # Sample IDs
  PCoA1 = pcoa_weighted$vectors[, "Axis.1"],  # PCoA Axis 1
  PCoA2 = pcoa_weighted$vectors[, "Axis.2"],  # PCoA Axis 2
  TotalCarbon = sample_metadata$total_carbon_percent  # Metadata for coloring the plot
)

# View the first few rows of the PCoA coordinates
head(pcoa_coords_weighted)

# Plot PCoA for Weighted UniFrac with PERMANOVA p-value
p_weighted <- ggplot(pcoa_coords_weighted, aes(x = PCoA1, y = PCoA2, color = TotalCarbon)) +
  geom_point(size = 3) +
  ggtitle("PCoA - Weighted UniFrac") +
  stat_ellipse(aes(color = TotalCarbon), level = 0.95, type = "t", linewidth = 1) +
  annotate("text", x = 0, y = mean(pcoa_coords_weighted$PCoA2, na.rm = TRUE) - 0.05, 
           label = paste("p-value =", round(p_value_weighted, 3)), size = 5)

# Display the plot
print(p_weighted)

# Unweighted plot

# Extract PCoA coordinates for the first two axes
pcoa_coords <- data.frame(
  SampleID = rownames(pcoa_unweighted$vectors),  # Sample IDs
  PCoA1 = pcoa_unweighted$vectors[, "Axis.1"],  # PCoA Axis 1
  PCoA2 = pcoa_unweighted$vectors[, "Axis.2"],  # PCoA Axis 2
  TotalCarbon = sample_metadata$total_carbon_percent  # Metadata for coloring the plot
)

# View the first few rows of the PCoA coordinates
head(pcoa_coords)

# Plot PCoA for Unweighted UniFrac with PERMANOVA p-value
p_unweighted <- ggplot(pcoa_coords, aes(x = PCoA1, y = PCoA2, color = TotalCarbon)) +
  geom_point(size = 3) +
  ggtitle("PCoA - Unweighted UniFrac") +
  stat_ellipse(aes(color = TotalCarbon), level = 0.95, type = "t", linewidth = 1) +
  annotate("text", x = 0, y = mean(pcoa_coords$PCoA2, na.rm = TRUE) - 2, 
           label = paste("p-value =", round(p_value_unweighted, 3)), size = 5)

# Display the plot
print(p_unweighted)

# Create boxplots

# Perform PERMANOVA for Weighted UniFrac
permanova_weighted <- adonis2(weighted_unifrac ~ total_carbon_percent, data = sample_metadata)

# Perform PERMANOVA for Unweighted UniFrac
permanova_unweighted <- adonis2(unweighted_unifrac ~ total_carbon_percent, data = sample_metadata)

# Extract p-values for both analyses
p_value_weighted <- permanova_weighted$`Pr(>F)`[1]
p_value_unweighted <- permanova_unweighted$`Pr(>F)`[1]

# Prepare data for plotting boxplot
# Convert the Weighted UniFrac distance matrix into a data frame
weighted_df <- data.frame(
  Distance = as.numeric(as.matrix(weighted_unifrac)[lower.tri(weighted_unifrac, diag = FALSE)]),
  total_carbon_percent = rep(sample_metadata$total_carbon_percent, each = nrow(sample_metadata)-1)
)

# Convert the Unweighted UniFrac distance matrix into a data frame
unweighted_df <- data.frame(
  Distance = as.numeric(as.matrix(unweighted_unifrac)[lower.tri(unweighted_unifrac, diag = FALSE)]),
  total_carbon_percent = rep(sample_metadata$total_carbon_percent, each = nrow(sample_metadata)-1)
)

# Plotting the boxplot for Weighted UniFrac (without individual points)
p_weighted <- ggplot(weighted_df, aes(x = total_carbon_percent, y = Distance, fill = total_carbon_percent)) +
  geom_boxplot() +
  ggtitle(paste("Boxplot - Weighted UniFrac (p-value =", round(p_value_weighted, 3), ")")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels for readability
  scale_fill_brewer(palette = "Set3")  # Color palette for boxplots

# Plotting the boxplot for Unweighted UniFrac (without individual points)
p_unweighted <- ggplot(unweighted_df, aes(x = total_carbon_percent, y = Distance, fill = total_carbon_percent)) +
  geom_boxplot() +
  ggtitle(paste("Boxplot - Unweighted UniFrac (p-value =", round(p_value_unweighted, 3), ")")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels for readability
  scale_fill_brewer(palette = "Set3")  # Color palette for boxplots

# Display the plots
print(p_weighted)
print(p_unweighted)
