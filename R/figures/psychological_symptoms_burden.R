#' Name         : psychological_symptoms_burden.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create the figure for psychological symptoms burden using variables
#'                H13_SQ* from the dataset. Using French data
#' Files created: - `results/figures/png/psychological_symptoms_burden.png`
#'                - `results/figures/pptx/psychological_symptoms_burden.pptx`
#'               - `data/processed/subdata/psychological_symptoms_burden.rds`
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

# Select variables of interest and respondents who completed the questionnaire
df <- data |>
  filter(included == 1L) |>
  select(id, starts_with("H13_SQ"))

# Extract labels
labs <- get_labels(df, include = -id)

# Reshape data and add labels
df_long <- df |>
  pivot_longer(
    cols = starts_with("H13_SQ"),
    names_to = "question",
    values_to = "response"
  ) |>
  left_join(labs, by = c("question" = "variable")) |>
  mutate(
    response = remove_val_labels(response) |>
      factor(
        levels = c(7, 2:6),
        labels = c(
          "I don't know",
          "Not at all bothersome",
          "Slightly bothersome",
          "Moderately bothersome",
          "Very bothersome",
          "Extremely bothersome"
        )
      )
  ) |>
  filter(!is.na(response)) |>
  mutate(
    n_ordering = sum(as.numeric(response) %in% c(6, 7)),
    .by = c(label)
  )

# Save the processed data
df_long |>
  mutate(
    response_num = as.numeric(response) - 2,
    response_num = ifelse(response_num < 1, NA, response_num) # Treat "I didn't get this symptom" and "I don't know" as missing
  ) |>
  select(id, question, response_num) |>
  pivot_wider(names_from = question, values_from = response_num) |>
  set_variable_labels(
    .labels = distinct(df_long, question, label) |> deframe() |> as.list()
  ) |>
  saveRDS("data/processed/subdata/psychological_symptoms_burden.rds")

n_total <- n_distinct(df_long$id)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Frequency, distribution and level of burden of psychological symptoms reported by respondents (N={n_total})."
)

# Create the figure --------------------------------------------------------

# Create a data set with the total number of responses per symptom
totals_df <- count(df_long, label, n_ordering) |>
  mutate(
    response = NA,
    perc = round(100 * n / n_total, 1),
    txt_label = glue::glue("{n} ({perc}%)")
  )


(fig <- df_long |>
  count(label, n_ordering, response) |>
  mutate(
    perc = round(100 * n / n_total, 1),
    txt_label = glue::glue("{n} ({perc}%)")
  ) |>
  ggplot(aes(x = n, y = reorder(label, n_ordering), fill = response)) +
  geom_col(position = "stack") +
  geom_text(data = totals_df, aes(label = txt_label), hjust = -0.25, size = 4) +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 10),
    expand = expansion(mult = c(0, 0.3))
  ) +
  scale_fill_manual(
    name = NULL,
    values = c(
      "I don't know" = "#B0BEC5",
      "Not at all bothersome" = "#2196F3",
      "Slightly bothersome" = "#4CAF50",
      "Moderately bothersome" = "#FFC107",
      "Very bothersome" = "#FF9800",
      "Extremely bothersome" = "#F44336"
    ),
    na.translate = FALSE
  ) +
  scale_y_discrete(
    labels = function(x) str_wrap(x, width = 50) # Wrap long labels
  ) +
  labs(
    y = "",
    x = "Number of responses",
    title = caption |> str_wrap(50)
  ) +
  theme_kce(font_size = 10) +
  theme(
    panel.grid.major.x = element_line(colour = "lightgray"),
    legend.position = "bottom"
  ) +
  guides(fill = guide_legend(nrow = 3)))

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/psychological_symptoms_burden.png",
  plot = fig,
  width = 8,
  height = 10,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  width = 8,
  height = 10,
  path = "results/figures/pptx/psychological_symptoms_burden.pptx",
  overwrite = TRUE
)
