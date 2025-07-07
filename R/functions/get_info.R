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
