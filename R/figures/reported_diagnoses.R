#' Name         : reported_diagnoses.R
#' Author       : Alexandre Bohyn
#' Date         : 2025-09-11
#' Purpose      : Create table of reported diagnoses. Using variables DSD1_A1 to DSD1_A12
#'                to define the diagnoses.
#' Files created: - `results/figures/png/reported_diagnoses.png`
#'                - `results/figures/pptx/reported_diagnoses.pptx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load the data ------------------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_fr.rds")

# Subset to relevant variables and patients who reached last page (16)
df <- data |>
  filter(included == 1L) |>
  select(id, starts_with("DSD1_A"))

# Assign the diagnoses as column names
diag_df <- get_labels(df, include = -id) |>
  rename(diagnosis = label)

# Pivot the data to long format and count the number of responses per diagnosis
fig_df <- df |>
  mutate(across(-id, remove_val_labels)) |>
  pivot_longer(
    cols = starts_with("DSD1_A"),
    names_to = "variable",
    values_to = "response"
  ) |>
  filter(response == 1) |>
  group_by(variable) |>
  summarise(n = n(), .groups = "drop") |>
  arrange(desc(n)) |>
  left_join(diag_df, by = "variable") |>
  mutate(
    diagnosis = as_factor(diagnosis) |>
      fct_reorder(n) |>
      fct_relevel("Je ne sais pas", after = 0)
  )

# Compute total number of responses
n_total <- nrow(df)

# Create the figure --------------------------------------------------------

fig <- fig_df |>
  mutate(
    perc = n / n_total,
    label = glue("{n} ({scales::percent(perc, accuracy = 1)})")
  ) |>
  ggplot(aes(y = diagnosis, x = n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = label), hjust = -0.25, size = 4) +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 5),
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(
    y = "",
    x = "Number of responses",
    title = glue::glue(
      "Reported diagnoses (N = {n_total})"
    ) |>
      str_wrap(50)
  ) +
  theme_kce(font_size = 12) +
  theme(
    panel.grid.major.x = element_line(colour = "lightgray")
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/reported_diagnoses.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/reported_diagnoses.pptx",
  overwrite = TRUE
)
