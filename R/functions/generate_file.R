#' Generate a Script File for a Table or Figure
#'
#' This function creates a new R script file based on a template, using metadata
#' from a pre-existing output index. It is intended to help standardize the creation
#' of scripts for generating tables or figures in a project.
#'
#' @param id A character string representing the unique identifier of the output
#'   (table or figure) to generate. This ID must be present in the output index.
#'
#' @return This function is called for its side effects. It creates a new R script
#'   file in the appropriate directory (`R/tables/` or `R/figures/`) and writes a
#'   templated header into it.
generate_file <- function(id) {
  # Load the output index
  index <- readRDS(here::here("data/output_index/output_index.rds"))

  # Check that the given id is valid
  valid_ids <- index$id
  if (!(id %in% valid_ids)) {
    cli::cli_abort("ID not present in output index")
  }

  # Filter the information of the corresponding file
  name <- index$file_name[index$id == id]
  type <- index$file_type[index$id == id]

  # Build the path of the file
  file_path <- here::here(glue::glue("R/{type}s/{name}.R"))

  # Define the template for the file header
  header_template <- readLines(here::here("templates/file_template.R"))
  header <- whisker::whisker.render(header_template)

  # Create the file
  fs::file_create(file_path)

  # Write the header to file
  writeLines(
    text = header,
    con = file_path
  )
}
