# Delete all png and powerpoint files
png_files <- fs::dir_ls("results/figures/png", glob = "*.png")
pptx_files <- fs::dir_ls("results/figures/pptx", glob = "*.pptx")
fs::file_delete(c(png_files, pptx_files))

# List all the R scripts in the R/figures folder
figure_scripts <- fs::dir_ls("R/figures", glob = "*.R")

# Source each script to regenerate the figures
purrr::walk(
  .x = figure_scripts,
  .f = source,
  .progress = list(
    type = "custom",
    total = length(figure_scripts),
    format = "{cli::pb_spin} Generating figures {cli::pb_current}/{cli::pb_total} [{cli::pb_elapsed}]",
    clear = FALSE
  )
)
