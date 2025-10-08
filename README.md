# NEED project

This repository contains the code and resources for the NEED project.

## Dependencies

To ensure that the project functions, please use R 4.4.2 and use the packages and their version listed in the DESCRIPTION file.

To  automatically update the pacakge to the minimum required version, please use:

```{r}
remotes::install_deps()
```

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
├── report
└── templates
```

The `data` directory contains all datasets used in the project, organized into:

* `metadata`: contains metadata files (table od contents, data dictionary, etc.)
* `processed`: contains cleaned and processed datasets ready for analysis (R data sets in FR, NL and EN)
  This folder also contains the `subdata` sub-folder with all the datasets used for the sub-analyses in the report (see `report` folder below).
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

The `report` folder contains the report for the sub-analyses as a R markdown (`.Rmd`) file, as well as the rendered report in `.docx` format.

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
- [ ] *interview_participants (not needed)*
- [X] eq5d5l_utility_score
- [X] treatment_by_diagnosis

### Sub-analyses tables

#### Sample characteristics

- [X] **tbl-patient-characteristics** — Patient characteristics

#### HRQoL

- [X] **tbl-hrqol-time** — Difference EQ-5D before onset of the symptoms vs today by time since diagnosis
- [X] **tbl-hrqol-diag** — Difference EQ-5D before onset of the symptoms vs today by diagnosis
- [X] **tbl-hrqol-age** — Difference EQ-5D before onset of the symptoms vs today by age

#### Physical symptoms & EQ-5D

- [X] **tbl-burden-phys-time** — Burden of physical symptoms by time since diagnosis
- [X] **tbl-burden-phys-diag** — Burden of physical symptoms by diagnosis
- [X] **tbl-pain-gender** — Pain/discomfort by gender
- [X] **tbl-mobility-gender** — Mobility by gender
- [X] **tbl-self-care-gender** — Self-care by gender
- [X] **tbl-usual-activities-gender** — Usual activities by gender

#### Psychological symptoms

- [X] **tbl-burden-psych-time** — Burden of psychological symptoms by time since diagnosis
- [X] **tbl-burden-psych-diag** — Burden of psychological symptoms by diagnosis
- [X] **tbl-anxiety-gender** — Anxiety/depression by gender

#### Specific health domains

- [X] **tbl-reproductive-health-gender** — Reproductive health by gender
- [X] **tbl-sexual-health-gender** — Sexual health by gender

#### Treatment & care experience

- [X] **tbl-treatment-use-diag** — Treatment use by time since diagnosis
- [X] **tbl-burden-treatment-time** — Burden of the treatment by time since diagnosis
- [X] **tbl-burden-treatment-involvement** — Burden of the treatment by involvement in treatment decisions
- [X] **tbl-satisfaction-organization-region** — Satisfaction with organization of care by geographical region
- [X] **tbl-reccurence-hcp-region** — Recurence of same healthcare personel by geographical region
- [X] **tbl-satisfaction-info-hcp-region** — Satisfaction with information received from healthcare personel by geographical region
- [X] **tbl-trt-choice-involvement-region** — Involvement in treatment choice by geographical region

#### Care timelines

- [X] **tbl-time-symptoms-decision-region** — Time between first symptoms and decision to search care (DSHC1) by region
- [X] **tbl-time-symptoms-decision-gender** — Time between first symptoms and decision to search care (DSHC1) by gender
- [X] **tbl-time-first-app-diagnosis-region** — Time between first symptoms and diagnosis (D13) by region
- [X] **tbl-time-diagnosis-treatment-region** — Time between diagnosis and treatment (HC1) by region

#### Care access & support

- [X] **tbl-forgone-care-region** — Forgone care by region
- [X] **tbl-social-support-region** — Social support needs by region
- [X] **tbl-social-support-gender** — Social support needs by gender

#### Life impacts

- [X] **tbl-impact-personal-relations-gender** — Impact on personal relations by gender
- [X] **tbl-impact-personal-relations-age** — Impact on personal relations by age
- [X] **tbl-impact-education-gender** — Impact on education by gender
- [X] **tbl-impact-work-gender** — Impact on work intensity by time since diagnosis
- [X] **tbl-impact-work-age** — Impact on work intensity by living situation
- [X] **tbl-impact-financial-living-situation** — Impact on financial situation by living situation
- [X] **tbl-impact-financial-time-since-diag** — Impact on financial situation by time since diagnosis
