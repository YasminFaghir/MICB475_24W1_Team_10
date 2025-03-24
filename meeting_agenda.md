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


# 📅 **Meeting Agenda – February 24, 2025**

🕒 **Time:** 12:05  
📍 **Location:** Biol 3026  
👥 **Attendees:** Nadia Arjomandi, Yasmin Faghir, Michelle Benitez-Muller, Ava Tiefenbach, Ingrid Wang  

## 📝 **1. Proposal Update**  
✅ The proposal has been written  
❓ Some questions remain unresolved  
⏳ Waiting for Evelyn’s feedback to confirm if we can proceed  

##  **2. Next Steps**  
🔹 Discuss necessary changes  
🔹 Outline potential refinements  
🔹 Plan for the next phase of the project  

##  **3. Open Discussion**  
Address any additional concerns:
- which files should be converted to csv in R

## Meeting Summary - Key Discussion Points
- Create metadata: Before phyloseq make sure metadata categories are changed into categorical first
- ideally want literature for category design, 2 categories best for analysis (high, low)
- want to know sample sizes for each category (table of how samples are binned) eg. check if there's only one sample with low pH --> will help us decide what our categories will be, whether low+high or high+very high.


# 📅 Meeting Agenda – March 3, 2025

🕒 **Time:** 12:05  
📍 **Location:** Biol 3026  
👥 **Attendees:** Nadia Arjomandi, Yasmin Faghir, Michelle Benitez-Muller, Ava Tiefenbach, Ingrid Wang  

## 📝 1. Proposal Feedback Discussion  

✅ Review feedback received on the proposal  
🔹 Identify key points that need revision or clarification  
🔹 Discuss necessary changes and potential refinements  

## 2. Discuss Metadata Wrangling on R
🔹 Converted numerical variables into categorical ones for pH, calcium, total nitrogen %, total carbon %, and respiration based on these parameters:
| Variable                                                           | Categories                                                                                                                                                                                      | Chosen Levels based on Data                                    |      
|--------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| pH                                                                 | Acidic: <6.7 <br/> Neutral: 6.7-7.2 <br/> Alkaline <7.2 <br/> https://pubmed.ncbi.nlm.nih.gov/18706678/ https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10805235/ https://pmc.ncbi.nlm.nih.gov/articles/PMC5569653/  | Acidic: <6.7 <br/> Neutral: 6.7-7.2 <br/> Alkaline <7.2                    | 
| Calcium                                                            | High: > 50 mg/L <br/> Medium: 10-50 <br/> Low: <=10  <br/> https://doi.org/10.1007/s11273-020-09771-8                                                                                                             | Medium: >10 <br/> Low: <=10 <br/> Data ranges from: ~0.05-32              | 
| Total Nitrogen (%)                                                 | High: >1.5 <br/> Medium: 0.5-1.5 <br/> Low: <0.5 <br/> https://www.epa.gov/sites/default/files/2018-10/documents/nutrient-criteria-manual-wetlands.pdf                                                            | High: >0.5% <br/> Low: <=0.5 <br/> Data ranges from: ~0.05 - 1.6          | 
| Total Carbon (%)                                                   | High: >40% <br/> Medium: 10-40 <br/> Low: <10 <br/> https://doi.org/10.1002/tqem.22283                                                                                                                                            | Medium: >10% <br/> Low: <=10% <br/> Data ranges from: ~0.3-36              |
| Respiration (ug C/g soil/day) 2 mmol L⁻¹ d⁻¹ = 240 µg C/g soil/day | High: >2.5 mmol L⁻¹ d⁻¹  <br/> Medium: 1.5-2.5 <br/> Low: <1.5 <br/> https://acsess.onlinelibrary.wiley.com/doi/10.1002/jeq2.20155                                                                                | High: >240 µg C/g soil/day <br/> Low: <=240 Data ranges from: ~3-307 |

🔹 Created a new metadata file with only those variables selected called wl_data.RData

## 3. Next Steps/Open Discussion  

🔹 Plan for implementing revisions based on feedback  
🔹 Establish a timeline for completing the next phase  


# 📝 Team Meeting Agenda
📅 **Date:**  March 9 

🕒 **Time:** 12:05 pm  
👥 **Attendees:** Yasmin Faghir, Nadia Arjomandi, Michelle Benitez-Muller, Ava Tiefenbach, Ingrid Wang 

## Agenda Items

### 1. Proposal Revisions  
- The proposal revision has been completed, and all comments were applied.  
- **Discussion:** Clarification regarding ASM referencing, is it acceptable to mention a source in the middle of the proposal but place the reference number at the end?  

### 2. Phyloseq Object and Metadata Review  
- The phyloseq object has been created.  
- **Note:** Metadata issue has been corrected — initially, only selected columns were kept, but now all necessary columns are included.  
- **Discussion:** Review the phyloseq object one more time to ensure it is correct before moving on.  

### 3. Next Steps: Alpha Diversity Metrics  
- Plan to compare alpha diversity metrics.  
- **Goal:** Identify which factors are significant.  
- **Discussion:** Approach and methods for this analysis.  

### 4. Questions and Final Clarifications  
- Open for any additional questions or concerns. 

## Next Meeting Planning




# 📝 Team Meeting Agenda
📅 **Date:** March 17

🕒 **Time:** 12:05 pm 

👥 **Attendees:** Yasmin Faghir, Nadia Arjomandi, Ava Tiefenbach, Ingrid Wang, Michelle Benitez-Muller

## Agenda Items

- Alpha and beta diversity analyses performed on different abiotic factors  
  - For nitrogen levels, there appears to be a **significant difference between low and high nitrogen** conditions
  -  While alpha diversity shows no significant differences in species richness across pH levels, beta diversity (PERMANOVA p = 0.001) reveals that pH strongly shapes microbial community composition.
  -  Carbon: While alpha diversity shows no significant differences in species richness across carbon levels, beta diversity (PERMANOVA p = 0.001) reveals that carbon strongly shapes microbial community composition.
  -  Calcium: Imbalanced Distribution of Calcium Categories, Dominated by Medium-Level Samples
  -  Respiration: While alpha diversity shows no significant differences in species richness across respiration levels, beta diversity (PERMANOVA p = 0.001) reveals that respiration strongly shapes microbial community composition.
- Presentation of figures for different abiotic factors (Ph, Nitrogen Level, Carbon Content, Respiration, and Calcium level)
-  Next steps are:Identify indicator taxa and perform core microbiome analysis


### 3. Open Discussion and next meeting planning   
Address any additional concern 



# 📝 Team Meeting Agenda
📅 **Date:** March 24th

🕒 **Time:** 12:05 pm 

👥 **Attendees:** Yasmin Faghir, Nadia Arjomandi, Ava Tiefenbach, Ingrid Wang, Michelle Benitez-Muller

## Agenda Items

- Reviewed core microbiome and indicator taxa analyses.

- Identified overlapping ASVs between core microbiome and ISA results.
  - All group members got different results for core microbiome and ISA results --> review code together and identify differences

- Discussed and compared current analyses to determine the best feature set for machine learning.

Next step: finalize feature selection and begin working on the machine learning script.

### . Next Steps (Goal for the upcoming week): focus on running and refining the ML model using the selected features.


