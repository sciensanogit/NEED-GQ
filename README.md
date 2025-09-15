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

The `data` directory contains all datasets used in the project, organized into: - `metadata`: contains metadata files (table od contents, data dictionary, etc.) - `processed`: contains cleaned and processed datasets ready for analysis (R data sets in FR, NL and EN) - `raw`: raw data from limesurvey export

The `R` directory contains R scripts organized into: - `data`: scripts for data processing and cleaning the raw data - `figures`: scripts for generating figures and visualizations - `functions`: reusable functions used across different scripts

The `results` directory contains output files such as figures, organized into: - `figures`: contains generated figures in both PNG and PPTX formats - `tables`: contains generated tables

The `templates` directory contains templates for R files for new figures and tables.

## TO DO

-   [ ] Fix the import script for raw data in NL
-   [ ] Fix the import script for raw data in EN
-   [ ] Correct the import of the EQ5D-5L data

## Progress

### Figures

-   [x] reported_diagnoses
-   [x] eq5d5l_health_score
-   [x] reported_comorbidities
-   [x] physical_symptoms_burden
-   [x] eq5d5l_pain_discomfort
-   [x] psychological_symptoms_burden
-   [x] eq5d5l_anxiety_depression
-   [x] eq5d5l_mobility
-   [x] eq5d5l_self_care
-   [x] eq5d5l_usual_activities
-   [ ] sexual_reproductive_health
-   [ ] side_effects_burden
-   [ ] care_organization_experience
-   [ ] hcp_information_satisfaction
-   [ ] treatment_choice_involvement
-   [ ] treatment_timing
-   [ ] forgone_care_causes
-   [ ] unmet_social_support
-   [ ] impact_personal_relations
-   [ ] impact_education
-   [ ] impact_work
-   [ ] impact_financial_situation
-   [ ] priority_need_categories

### Tables

-   [ ] clinical_features_psychotic
-   [ ] antipsychotics_side_effects
-   [ ] demographics_survey
-   [ ] interview_participants
-   [ ] eq5d5l_utility_score
-   [ ] treatment_by_diagnosis