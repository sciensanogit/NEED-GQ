#' Name         : define_language.R
#' Author       : Alexandre Bohyn
#' Date         : 2025-10-08
#' Purpose      : Define the language of the figures and tables.
#' Files created: `data/processed/data_current.rds`
#' Edits        :

lang <- "EN" # Change to "FR" for French

# If the language is EN use `data_en.rds`, if FR use `data_fr.rds`, else throw an error.
if (lang == "EN") {
  data <- readRDS("data/processed/data_en.rds")
} else if (lang == "FR") {
  data <- readRDS("data/processed/data_fr.rds")
} else {
  stop("Language not supported. Please use 'EN' or 'FR'.")
}

# Save the data with the defined language as `data_current.rds` (used in all figures and tables scripts)
saveRDS(data, "data/processed/data_current.rds")
