# NEED project

## Project description

## Project structure

```
├── data
│   ├── processed
│   └── raw
├── docs
├── output
│   ├── figures
│   └── tables
├── R
│   ├── data
│   ├── figures
│   ├── functions
│   └── tables
├── README.md
└── changelog.md
```

### R files and generated outputs

All `*.R` files must be stored in the `R/` folder, and its subfolders.
Any file located in the `R/tables/` or `R/figures` folder must generate an output that must be saved in the `output/tables/` or `output/figures` folder.
Helper functions for data management, file saving, and so on must be saved in the `R/functions/`.
Any script used to generate data files (i.e. `.rds` files), should be stored in the `R/data/` folder.

### Data files

All the raw data files (`.csv`, `.xlsx`, ...) must be stored in the `data/raw/` folder.
All data imported, generated, or modified through a R script must be saved as a `.rds` data file in the `data/processed` folder.

### Additional files

The `README` file should contain all details about the project, its goal and its structure.
Any change to the project should be documented in the `changelog.md` file.

## Style guide

### File 

#### Naming

All files should be named using snake case (i.e. lowercase letters and separated by underscores.)

#### Structure

All R files should start with the following header (variables in brackets should be changed):

```{r}
#' Name         : {name}
#' Author       : Alexandre Bohyn
#' Date         : 2025-07-07
#' Purpose      : {description}
#' Files created: `{data_file}`
#' Edits        :

# File information -----------------------------------------------------

info <- get_info({id})

# Packages -------------------------------------------------------------


```

The purpose of the header is to describe what the file does and which files are created.
Different sections of the R script should be defined with sections (see the `Packages` section in the header above).

To avoid problmes with project-specific directory dependencies, all paths in files should be generated with the `here::here()` function.
