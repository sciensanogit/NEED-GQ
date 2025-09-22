# NEED project

This repository contains the code and resources for the NEED project.

## Structure

The current structure of the repository is as follows:

```
.
├── data
│   ├── metadata
│   ├── processed
│   └── raw
├── R
│   ├── data
│   ├── figures
│   └── functions
├── results
│   └── figures
│       ├── png
│       └── pptx
└── templates
```

The `data` directory contains all datasets used in the project, organized into: 

* `metadata`: contains metadata files (table od contents, data dictionary, etc.)
* `processed`: contains cleaned and processed datasets ready for analysis (R data sets in FR, NL and EN)
* `raw`: raw data from limesurvey export

The `R` directory contains R scripts organized into:

* `data`: scripts for data processing and cleaning the raw data
* `figures`: scripts for generating figures and visualizations and saving them as png and pptx files
* `tables`: scripts for generating tables and saving them as docx files
* `functions`: reusable functions used across different scripts

The `results` directory contains output files such as figures, organized into: 

* `figures`: contains generated figures in both PNG and PPTX formats
* `tables`: contains generated tables in DOCX format

The `templates` directory contains templates for R files for new figures and tables.

## TO DO

- [ ] Fix the import script for raw data in NL
- [ ] Fix the import script for raw data in EN

### Data import issue

The script importing and relabeling the data in EN (and NL too) is not working properly because it labels 218 columns while the actual datasets contains 251 columns. Therefore, some columns are not labelled, and some might be matched to a wrong label.

The best way to solve this would be to generate a data dictionary for the FR version, and a data dictionary for the EN version. Then, they could be compared to fix the EN version. This EN data dictionary could then be used to relabel the raw data properly.

WARNING: this might take some time to setup so it hasn't been done now.

Another option is that Robby fixes the EN script manually.

## Progress

### Figures

- [X] reported_diagnoses
- [X] eq5d5l_health_score
- [X] reported_comorbidities
- [X] physical_symptoms_burden
- [X] eq5d5l_pain_discomfort
- [X] psychological_symptoms_burden
- [X] eq5d5l_anxiety_depression
- [X] eq5d5l_mobility
- [X] eq5d5l_self_care
- [X] eq5d5l_usual_activities
- [X] sexual_reproductive_health
- [ ] *side_effects_burden (might be similar to psychological_symptoms_burden ?)*
- [X] care_organization_experience
- [X] hcp_information_satisfaction
- [X] treatment_choice_involvement
- [X] treatment_timing
- [X] forgone_care_causes
- [X] unmet_social_support
- [X] impact_personal_relations
- [X] impact_education
- [X] impact_work
- [X] impact_financial_situation
- [X] priority_need_categories

### Tables

- [X] clinical_features_psychotic
- [X] antipsychotics_side_effects
- [X] demographics_survey

- ~~ interview_participants (not needed)~~

- [X] eq5d5l_utility_score
- [X] treatment_by_diagnosis
