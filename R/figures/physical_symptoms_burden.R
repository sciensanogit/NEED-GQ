#' Name         : physical_symptoms_burden.R
#' Author       : Alexandre Bohyn
#' Date         : September 12, 2025
#' Purpose      : Bar chart of physical symptoms burden using variables HC5_SQ to define
#'               the symptoms. The burden is defined on a Likert scale.
#'               Using the French dataset.
#' Files created: - `results/figures/png/physical_symptoms_burden.png`
#'                - `results/figures/pptx/physical_symptoms_burden.pptx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_fr.rds")

# Subset to relevant columns and filter to last survey only
df <- data |>
  filter(included == 1L) |>
  select(id, matches("^HC5_SQ\\d+$"))
# Setting the Likert scale as an ordered factor
# mutate(across(starts_with("HC5_SQ"), ~to_factor(.x)))

# Isolate the human-readable names from the column labels
labels <- names(df)[-1] |>
  map_chr(~ attr(data[[.x]], "label")) |>
  str_extract("(?<=\\[)[^]]+(?=\\])") |>
  str_trim() |>
  setNames(names(df)[-1]) |>
  enframe(name = "variable", value = "label")

# Pivot into long format and add label
df_long <- df |>
  pivot_longer(
    cols = -id,
    names_to = "variable",
    values_to = "response"
  ) |>
  filter(!is.na(response) & response != 6) |>
  mutate(response = to_factor(response)) |>
  count(variable, response) |>
  left_join(labels, by = "variable") |>
  mutate(total = sum(n), .by = variable)

n_total <- nrow(df)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Frequency, distribution and level of burden of physical symptoms reported by respondents (N={n_total})"
)

# Create the figure --------------------------------------------------------

# Create a data set with the total number of responses per symptom
totals_df <- df_long |>
  distinct(total, label) |>
  mutate(n = total, response = NA)

fig <- df_long |>
  ggplot(aes(x = n, y = reorder(label, total), fill = response)) +
  geom_col(position = "stack") +
  geom_text(data = totals_df, aes(label = n), hjust = -0.25, size = 5) +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 10),
    expand = expansion(mult = c(0, 0.1))
  ) +
  see::scale_fill_material(name = "", na.translate = F) +
  scale_y_discrete(
    labels = function(x) str_wrap(x, width = 40) # Wrap long labels
  ) +
  labs(
    y = "",
    x = "Number of responses",
    title = caption |> str_wrap(50)
  ) +
  theme_kce(font_size = 12) +
  theme(
    panel.grid.major.x = element_line(colour = "lightgray"),
    legend.position = "bottom"
  ) +
  guides(fill = guide_legend(nrow = 2))

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/physical_symptoms_burden.png",
  plot = fig,
  width = 8,
  height = 8,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/physical_symptoms_burden.pptx",
  width = 8,
  height = 8,
  overwrite = TRUE
)
