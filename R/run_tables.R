# Delete all word files
docx_files <- fs::dir_ls("results/tables", glob = "*.docx")
fs::file_delete(docx_files)

# List all the R scripts in the R/figures folder
table_scripts <- fs::dir_ls("R/tables", glob = "*.R")

# Source each script to regenerate the figures
purrr::walk(
  .x = table_scripts,
  .f = source,
  .progress = list(
    type = "custom",
    total = length(table_scripts),
    format = "{cli::pb_spin} Generating tables {cli::pb_current}/{cli::pb_total} [{cli::pb_elapsed}]",
    clear = FALSE
  )
)
