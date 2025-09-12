create_pptx <- function(
  ggobj,
  path,
  left = 0.5,
  top = 1,
  width = 9,
  height = 6,
  overwrite = TRUE
) {
  # if file does not yet exist, create new PowerPoint ----
  if (!file.exists(path)) {
    out <- officer::read_pptx()
  } else {
    if (overwrite) {
      out <- officer::read_pptx()
    } else {
      out <- officer::read_pptx(path)
    }
  }

  out %>%
    officer::add_slide() %>%
    officer::ph_with(
      rvg::dml(ggobj = ggobj),
      location = officer::ph_location(
        width = width,
        height = height,
        left = left,
        top = top
      )
    ) %>%
    base::print(target = path)
}
