#' Name         : reported_comorbidities.R
#' Author       : Alexandre Bohyn
#' Date         : September 12, 2025
#' Purpose      : Bar chart of reported comorbidities using variables D15_* to define
#'               the comorbidities. Using the French dataset.
#' Files created: - `results/figures/png/reported_comorbidities.png`
#'                - `results/figures/pptx/reported_comorbidities.pptx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(ggtext)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset to relevant columns and filter to last survey only
df <- data |>
  filter(included == 1L) |>
  filter(D14 == 1) |> # Other health conditions reported
  select(id, matches("^D15_\\d+$"))

# Isolate the diagnoses from the column labels
comorbs <- names(df)[-1] |>
  map_chr(~ attr(data[[.x]], "label")) |>
  str_extract("(?<=\\[)[^]]+(?=\\])") |>
  # Remove anything in parentheses and trim whitespace
  str_remove("\\s*\\(.*\\)$") |>
  str_trim()

# Assign the diagnoses as column names
comorbs_df <- setNames(names(df)[-1], comorbs) |>
  enframe(name = "comorbidity", value = "variable")

# Pivot the data to long format and count the number of responses per diagnosis
fig_df <- df |>
  pivot_longer(
    cols = -id,
    names_to = "variable",
    values_to = "response"
  ) |>
  filter(response == 1) |>
  group_by(variable) |>
  summarise(n = n(), .groups = "drop") |>
  arrange(desc(n)) |>
  left_join(comorbs_df, by = "variable")

n_total <- nrow(df)

# Define caption |>str_wrap(50) -----------------------------------------------------------------

caption <- glue(
  "Reported comorbidities (N={n_total})"
)

# Create the figure --------------------------------------------------------

fig <- fig_df |>
  mutate(
    perc = n / n_total,
    label = glue("{n} ({scales::percent(perc, accuracy = 1)})")
  ) |>
  ggplot(aes(y = reorder(comorbidity, n), x = n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = label), hjust = -0.25, size = 5) +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 5),
    expand = expansion(mult = c(0, 0.4))
  ) +
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
    panel.grid.major.x = element_line(colour = "lightgray")
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/reported_comorbidities.png",
  plot = fig,
  width = 8,
  height = 8,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/reported_comorbidities.pptx",
  width = 8,
  height = 8,
  overwrite = TRUE
)
