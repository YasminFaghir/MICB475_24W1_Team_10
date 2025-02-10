# Proposal Outline
## Research Question: What are the key environmental drivers of microbial composition in wetlands and their impact on microbial diversity?

## Experimental Aims
1. Ecosystem Health & Conservation

- Wetlands support diverse microbial communities crucial for nutrient cycling, organic matter decomposition, and water purification.
- Identifying microbial indicators can help monitor ecosystem stability and degradation.
2. Agriculture & Soil Health

- Wetland microbes improve soil fertility and structure, reducing reliance on chemical fertilizers.
- Certain microbes enhance nitrogen fixation, carbon sequestration, and drought resilience, supporting sustainable farming.
- Understanding microbial shifts helps mitigate agricultural runoff pollution in wetlands.
3. Climate Regulation & Greenhouse Gas Mitigation

- Wetlands are key regulators of methane (CH₄), carbon dioxide (CO₂), and nitrous oxide (N₂O) emissions.
- Microbial analysis can guide strategies to reduce emissions from agricultural landscapes.
4. Environmental Monitoring & Predictive Modeling

- Developing a machine learning model can predict microbial responses to environmental changes.
- This can support precision agriculture, pollution control, and wetland restoration efforts.

## Approach
1. Identify key environmental variables
- choose variables that can be categorized: 
  - (acidic, neutral, basic) pH 
  - (low, mid, high) elevation, total carbon, total nitrogen, respiration
2. Processing Data
- denoising+clustering-->training classifier-->rarefaction
3. Diversity Analysis
- Alpha and Beta Diversity 
  - analyze p values to see which variables have a significant effect
4. Predictive Taxonomic Model
- indicator species analysis on ASVs to identify taxa strongly associated with specific environmental variables
5. Machine Learning Validation


## Dataset Overview Checklist Items
Questions to answer:
How was data filtered? What samples were included/excluded?

Denoising tool used:
|               | Before Denoising |  After denoising |
| ------------- | ------------- | ------------- |
| Total Sample Size  |          |         |
| Sequencing Depth  | (should be a range) |        |

Maximum read length for sample:
Truncation length:
Truncation justification based on the quality plot:

Rarefaction depth:
Samples discarded at rarefaction depth:
**Include a rarefaction curve with a line displaying where the sampling depth is set

