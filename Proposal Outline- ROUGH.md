# Proposal Outline
## Research Question: How can microbial taxa in wetlands predict specific abiotic variables in the environment?

## Experimental Aims
1.Wetlands Are Biodiversity Hotspots
- Wetlands host diverse microbial communities that play essential roles in nutrient cycling, organic matter decomposition, and greenhouse gas emissions.
- Understanding how environmental factors shape microbial composition can provide insights into ecosystem health and resilience.
  
2.Microbial Communities Drive Wetland Functions
- Microbes mediate carbon and nitrogen cycles, influencing wetland productivity and climate regulation through CO₂ and CH₄ fluxes.
- Identifying key microbial taxa linked to specific environmental conditions can help predict how wetlands respond to climate change or human disturbances.
  
3.Predicting Microbial Responses to Environmental Change
- By correlating pH, carbon, nitrogen, elevation, and respiration rates with microbial diversity, we can predict how microbial communities shift under different environmental scenarios.
- This can inform wetland restoration and conservation efforts by identifying microbial indicators of ecosystem stability or degradation.
  
4.Supporting Sustainable Agriculture
- Wetland microbes improve soil fertility and structure, aiding in nutrient retention and reducing fertilizer dependence for nearby agricultural lands.
- Understanding microbial interactions can help mitigate agricultural runoff pollution, preventing excess nitrogen and phosphorus from harming wetland ecosystems.
  
5.Environmental Monitoring & Predictive Modeling
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

