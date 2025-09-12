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
- `metadata`: contains metadata files (table od contents, data dictionary, etc.)
- `processed`: contains cleaned and processed datasets ready for analysis (R data sets in FR, NL and EN)
- `raw`: raw data from limesurvey export

The `R` directory contains R scripts organized into:
- `data`: scripts for data processing and cleaning the raw data
- `figures`: scripts for generating figures and visualizations
- `functions`: reusable functions used across different scripts

The `results` directory contains output files such as figures, organized into:
- `figures`: contains generated figures in both PNG and PPTX formats
- `tables`: contains generated tables

The `templates` directory contains templates for R files for new figures and tables.