#' Name         : forgone_care_causes.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      :
#' Files created: - `results/figures/png/forgone_care_causes.png`
#'                - `results/figures/pptx/forgone_care_causes.pptx`
#'                - `data/processed/subdata/forgone_care_causes_data.rds`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset to relevant columns and filter to last survey only
df <- data |>
  filter(included == 1L) |>
  filter(HC12 == 1) |> # Forgone care reported
  select(id, matches("^HC13_SQ\\d+$"))

# Isolate the diagnoses from the column labels
labs <- get_labels(df, include = -id) |>
  mutate(label = str_remove(label, " \\(.*\\)$")) # Remove anything in parentheses

# Pivot the data to long format and count the number of responses per diagnosis
df_long <- df |>
  pivot_longer(
    cols = -id,
    names_to = "variable",
    values_to = "response"
  ) |>
  filter(response == 1) |>
  left_join(labs, by = "variable")

# Pivot to wide format and save for future use
df_long |>
  select(id, variable, response) |>
  mutate(response = unclass(response)) |>
  pivot_wider(
    names_from = variable,
    values_from = response,
    values_fill = 0
  ) |>
  set_variable_labels(
    .labels = as.list(labs$label) |> setNames(labs$variable),
    .strict = FALSE
  ) |>
  write_rds("data/processed/subdata/forgone_care_causes_data.rds")

# Count the number of responses per diagnosis
df_count <- df_long |>
  count(label, name = "n") |>
  mutate(
    perc = n / nrow(df),
    text_label = glue("{n} ({scales::percent(perc, accuracy = 1)})")
  ) |>
  arrange(desc(n))

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Causes of forgone care mentioned by survey participants (N={nrow(df)})."
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(y = reorder(label, n), x = n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = text_label), hjust = -0.25, size = 5) +
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
  filename = "results/figures/png/forgone_care_causes.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/forgone_care_causes.pptx",
  overwrite = TRUE
)
