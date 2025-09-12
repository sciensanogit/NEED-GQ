get_labels <- function(df, include = everything(), extract = TRUE) {
  sub <- df |> select({{ include }})
  vars <- names(sub)
  labs <- purrr::map_chr(vars, ~ attr(data[[.x]], "label"))
  if (extract) {
    labs <- stringr::str_extract(labs, "(?<=\\[)[^]]+(?=\\])") |>
      stringr::str_trim()
  }
  names(vars) <- labs
  enframe(vars, name = "label", value = "variable")
}
