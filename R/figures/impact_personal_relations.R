#' Name         : impact_personal_relations.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      :
#' Files created: - `results/figures/png/impact_personal_relations.png`
#'                - `results/figures/pptx/impact_personal_relations.pptx`
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

# Subset and modify the data
df <- data |>
  filter(lastpage == 16) |>
  select(id, answer = S6)

# Pivot to long, filter unwanted answers and label the variables
df_long <- df |>
  mutate(across(-id, remove_val_labels)) |>
  filter(!is.na(answer)) |>
  mutate(
    answer = factor(
      answer,
      levels = c(1:6),
      labels = c(
        "Not at all",
        "Slightly",
        "Moderately",
        "A lot",
        "Extremely",
        "I don't know"
      )
    )
  )

# Make into a count table
df_count <- df_long |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Impact of the psychosis disorder on personal relations (N={unique(df_count$total)})"
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.45))) +
  labs(
    title = str_wrap(caption, width = 60),
    x = "",
    y = "Number of patients"
  ) +
  theme_kce(font_size = 16) +
  see::scale_fill_material() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.y = element_line(size = 0.1, color = "grey80")
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/impact_personal_relations.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/impact_personal_relations.pptx",
  overwrite = TRUE
)
