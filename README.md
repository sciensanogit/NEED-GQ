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

## Data management (to do's)

- [ ] Adapt import scripts for raw data to other languages

- [ ] Create data dictionarry in every language

### Data import issue

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
