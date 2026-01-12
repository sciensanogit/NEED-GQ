#' Name         : side_effects_burden.R
#' Author       : Alexandre Bohyn
#' Date         : 10 October 2025
#' Purpose      : description
#' Files created: `output/figures/side_effects_burden.png/pdf`
#' Edits        :
#'  - 10 October 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)
library(flextable)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset to relevant columns and filter to last survey only
df <- data |>
  filter(included == 1L) |>
  select(id, matches("^HC5_SQ\\d+$")) |>
  filter(!if_all(matches("^HC5_SQ\\d+$"), is.na)) # Remove rows with all missing values
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
  filter(!is.na(response)) |>
  mutate(
    response = factor(
      response,
      levels = c(6, 1:5),
      labels = c(
        "I don't know",
        "Not at all burdensome",
        "Slightly burdensome",
        "Moderately burdensome",
        "Very burdensome",
        "Extremely burdensome"
      )
    ),
    response_num = case_match(
      response,
      "I don't know" ~ NA_real_,
      "Not at all burdensome" ~ 1,
      "Slightly burdensome" ~ 2,
      "Moderately burdensome" ~ 3,
      "Very burdensome" ~ 4,
      "Extremely burdensome" ~ 5
    )
  ) |>
  left_join(labels, by = "variable")

# Turn answers to numeric and pivot to wide. Then, save the dataset
df_long |>
  select(id, variable, response_num) |>
  pivot_wider(names_from = variable, values_from = response_num) |>
  set_variable_labels(
    .labels = distinct(df_long, variable, label) |> deframe() |> as.list()
  ) |>
  saveRDS("data/processed/subdata/physical_symptoms_burden.rds")

# Count the number of responses per symptom and level of burden
df_count <- df_long |>
  filter(response != "I don't know") |>
  count(response, label) |>
  mutate(total = sum(n), .by = label)

n_total <- nrow(df)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Distribution of reported side-effects by level of burden (N={n_total})"
)

# Create the figure --------------------------------------------------------

# Create a data set with the total number of responses per symptom
totals_df <- df_count |>
  distinct(total, label) |>
  mutate(
    n = total,
    response = NA,
    perc = round(100 * n / n_total, 1),
    txt_label = glue::glue("{n} ({perc}%)")
  )

fig <- df_count |>
  ggplot(aes(x = n, y = reorder(label, total), fill = response)) +
  geom_col(position = "stack") +
  geom_text(data = totals_df, aes(label = txt_label), hjust = -0.25, size = 4) +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 10),
    expand = expansion(mult = c(0, 0.3))
  ) +
  scale_fill_manual(
    name = "",
    values = c(
      "I don't know" = "#B0BEC5",
      "Not at all burdensome" = "#2196F3",
      "Slightly burdensome" = "#4CAF50",
      "Moderately burdensome" = "#FFC107",
      "Very burdensome" = "#FF9800",
      "Extremely burdensome" = "#F44336"
    ),
    na.translate = F
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
    panel.grid.major.x = element_line(colour = "lightgray"),
    legend.position = "bottom"
  ) +
  guides(fill = guide_legend(nrow = 2))

# Create the corresponding table ------------------------------------------

tab <- df_count |>
  select(response, n, label) |>
  pivot_wider(names_from = "response", values_from = "n", values_fill = 0) |>
  rename("Symptom" = label) |>
  flextable() |>
  add_header_row(
    values = c("Symptom", "Response"),
    colwidths = c(1, 5),
  ) |>
  align(align = "center", part = "header") |>
  merge_v(part = "header") |>
  set_caption(
    caption = "Table: Distribution of reported side-effects by level of burden"
  )

# Export the table
flextable::save_as_docx(
  tab,
  path = "results/tables/side_effects_burden.docx"
)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/side_effects_burden.png",
  plot = fig,
  width = 8,
  height = 8,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/side_effects_burden.pptx",
  width = 8,
  height = 8,
  overwrite = TRUE
)
