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
  filter(lastpage == 16) |>
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
      levels = c(1:6),
      labels = c(
        "Not a priority",
        "Low priority",
        "Medium priority",
        "High priority",
        "Very high priority",
        "Don't know"
      )
    )
  ) |>
  left_join(labs, by = join_by("question" == "variable"))

# Count the number of responses per category and answer
df_count <- df_long |>
  count(label, answer) |>
  mutate(total = sum(n), .by = label)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Priority rating of need categories (N={n_distinct(df_long$id)})."
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(x = n, y = reorder(label, total), fill = answer)) +
  geom_col(position = "stack") +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 10),
    expand = expansion(mult = c(0, 0)),
    limits = c(0, NA)
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
