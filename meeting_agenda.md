# 📝 Team Meeting Agenda: Paper Selection for Project Two

📅 **Date:** Feb 3  
🕒 **Time:** 12:05 pm  
📍 **Location:** Zoom  
👥 **Attendees:** Nadia Arjomandi, Michelle Benitez-Muller, Yasmin Faghir, Ava Tiefenbach, Ingrid Wang

---

## Agenda

### 1️⃣ Welcome and Updates
- Quick updates from each team member.
---

### 2️⃣ Discussion: Paper Options for Project Two

#### A. Gastric Cancer Paper
- **Strengths**:
  - High relevance to disease-focused microbiome studies.
  - Potentially impactful for human health research.
- **Limitations**:
  - Dataset concerns: Issues identified in the paper's methods may lead to challenges.
- **Open Discussion**:
  - Does the dataset meet our project's objectives?
  - Are there potential workarounds for the dataset issues?

#### B. Wetland Microbiome Paper
- **Strengths**:
  - Broader environmental scope with rich datasets.
  - Flexibility to explore diverse research questions.
- **Potential Research Questions**:
  - Are there specific microbial families that dominate under certain conditions (e.g., pH, CO2 flux, nitrate levels)?
  - Can microbial families serve as indicators of environmental conditions?
  - How do latitude, longitude, and elevation affect microbial diversity?
  - Which environmental variables significantly change microbiome composition?
  - What would be the effects of microbial communities on nutrient levels in soil long-term and potential effects on crop diseases.
- **Open Discussion**:
  - Comfort level with analyzing environmental datasets.
  - Does the team feel confident about addressing these questions?

  #### Meeting Summary - Key Discussion Points
Metadata Selection & Processing:

- Only significant variables should be retained to ensure meaningful analysis.
- Diversity analysis must use categorical data.
- Continuous variables should be converted into categorical, and p-values should be used to identify significant factors.
- pH should be categorized into acidic, neutral, and basic.
- Type of land classification can be determined based on metadata content.

#### From the shared meeting notes (image), the following steps are emphasized:
- Choose metadata categories to keep, ensuring that numerical/continuous variables are converted into categorical.
- Develop a diversity analysis model to assess the significance of different variables.
- Identify the most significant category and use it to build a taxonomic model.
- Test the model using machine learning. 

#### Next Steps Before the Next Team Meeting:
- Outline research objectives for the proposal.
- Prepare the outline of the proposal.
- Prepare & finalize the dataset for analysis, ensuring that it is processed correctly.
- Describe and explain the processing of dataset (# of reads, how it was cleaned).
- Ensure all necessary files are prepared for R processing before proceeding with analysis.

  # 📝 Team Meeting Agenda: Proposal Refinement and Clarifications

📅 **Date:** Feb 10  
🕒 **Time:** 12:05  
📍 **Location:** Biol 3026  
👥 **Attendees:** Nadia Arjomandi, Yasmin Faghir, Michelle Benitez-Muller, Ava Tiefenbach, Ingrid Wang  

---

## **Agenda**  

### **1️⃣ Welcome and Team Updates**  
- Quick check-in from each team member.  
- Recap of what has been done so far.  
- Identify major points of confusion and unresolved questions.  

---

## 1. Research Progress & Proposal Development  
- Finalized research aims focusing on microbial communities in wetlands and their ecological significance.  
- Defined key research questions related to biodiversity, nutrient cycling, and climate impact.  
- Established a predictive modeling approach to assess microbial responses to environmental changes.  

## 2. Methodology & Experimental Design  
### Identified Key Environmental Variables:  
- pH (acidic, neutral, basic)  
- Elevation, total carbon, total nitrogen, and respiration rates (low, mid, high)  

### Data Processing Pipeline:  
- Applied denoising and clustering techniques for sequence data  
- Conducted rarefaction analysis to determine appropriate sampling depth  

## 3. Diversity & Predictive Analysis  
### Alpha & Beta Diversity Analysis:  
- Assessed microbial community variation across environmental gradients  
- Performed statistical analysis (*p*-values) to determine significant correlations  

### Predictive Taxonomic Modeling:  
- Indicator species analysis to link microbial taxa with environmental factors  
- Developing machine learning models for predictive environmental monitoring  

## 4. Dataset Overview & Validation  
### Filtering & Sample Selection:  
- Reviewed inclusion/exclusion criteria for sequencing data  

### Denoising & Sequencing Stats:   
- Pre/Post-denoising sample size comparison  
- Truncation length determined based on quality plots  

### Rarefaction Analysis:  
- Established rarefaction depth  
- Generated rarefaction curve for validation  

## 5. Next Steps & Feedback Request  
- Continue refining machine learning model for microbial predictions.  
- Validate taxonomic classifications and confirm significant environmental correlations.  
- Request mentor’s feedback on methodology and dataset validation approach.  
