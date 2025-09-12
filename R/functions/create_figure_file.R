create_figure <- function(name, overwrite = FALSE) {
  # Abort if file existst
  usethis:::check_files_absent(
    here::here("R/figures", paste0(name, ".R")),
    overwrite = overwrite
  )
  # Data list for template
  data <- list(name = name, date = format(Sys.Date(), "%B %d, %Y"))
  # Render the template
  template <- whisker::whisker.render(
    template = readLines(here::here("templates/figure.R")),
    data = data
  )
  # Save it to file
  writeLines(template, con = here::here("R/figures", paste0(name, ".R")))
  # Message
  cli::cli_alert_success(
    "Figure script {.file {name}.R} created in {.path R/figures/}"
  )
  usethis:::edit_file(here::here("R/figures", paste0(name, ".R")))
}
