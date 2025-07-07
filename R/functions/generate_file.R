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
