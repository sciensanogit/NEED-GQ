#' Name         : priority_need_categories.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      :
#' Files created: - `results/figures/png/priority_need_categories.png`
#'                - `results/figures/pptx/priority_need_categories.pptx`
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

# Subset the data and select the relevant variables
df <- data |>
  filter(included == 1L) |>
  select(id, starts_with("P1"))

# Obtain labels
labs <- get_labels(df, include = -id) |>
  # Remove what's in parentheses
  mutate(label = str_remove(label, " \\(.*\\)"))

# Pivot to long format, harmonize the answers
df_long <- df |>
  mutate(across(-id, remove_val_labels)) |>
  pivot_longer(
    cols = starts_with("P1"),
    names_to = "question",
    values_to = "answer"
  ) |>
  filter(!is.na(answer)) |>
  mutate(
    answer = factor(
      answer,
      levels = c(6, 1:5),
      labels = c(
        "I don't know",
        "Not a priority",
        "Low priority",
        "Medium priority",
        "High priority",
        "Very high priority"
      )
    )
  ) |>
  left_join(labs, by = join_by("question" == "variable")) |>
  mutate(
    n_ordering = sum(as.numeric(answer) %in% c(5, 6)),
    .by = c(label)
  )

# Count the number of responses per category and answer
df_count <- df_long |>
  count(label, n_ordering, answer) |>
  mutate(total = sum(n), .by = label)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Priority rating of need categories (N={n_distinct(df_long$id)})."
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(x = n, y = reorder(label, n_ordering), fill = answer)) +
  geom_col(position = "stack") +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 10),
    expand = expansion(mult = c(0, 0)),
    limits = c(0, NA)
  ) +
  scale_fill_manual(
    name = NULL,
    values = c(
      "I don't know" = "#B0BEC5",
      "Not a priority" = "#2196F3",
      "Low priority" = "#4CAF50",
      "Medium priority" = "#FFC107",
      "High priority" = "#FF9800",
      "Very high priority" = "#F44336"
    )
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

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/priority_need_categories.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/priority_need_categories.pptx",
  overwrite = TRUE
)
