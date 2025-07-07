#' Retrieve Metadata for a Specific Output
#'
#' This function extracts and returns metadata for a given output ID (e.g., a table or figure)
#' from a centralized output index. It is useful for programmatically accessing information
#' about outputs used in a project.
#'
#' @param id A character string representing the unique identifier of the output.
#'   This ID must exist in the output index.
#'
#' @return A named list containing:
#' \describe{
#'   \item{id}{The ID of the output.}
#'   \item{name}{The file name associated with the output.}
#'   \item{type}{The type of output, such as "table" or "figure".}
#'   \item{caption}{The caption or description of the output.}
#'   \item{path}{The full path to the corresponding R script file.}
#' }
get_info <- function(id) {
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

  # Build the path
  path <- here::here(glue::glue("R/{{type}}s/{{name}}.R"))

  # Return a list with information of interest
  list(
    id = id,
    name = name,
    type = type,
    caption = index$caption[index$id == id],
    path = path
  )
}
