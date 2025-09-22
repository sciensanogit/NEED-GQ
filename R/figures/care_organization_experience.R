#' Name         : care_organization_experience.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create a bar chart of the care organization experience for questions
#'               HC7, HC8, HC9.
#' Files created: - `results/figures/png/care_organization_experience.png`
#'                - `results/figures/pptx/care_organization_experience.pptx`
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

# Subset and keep only the relevant variables
df <- data |>
  filter(lastpage == 16) |>
  select(id, HC7, HC9) |>
  filter(if_any(c(HC7, HC9), ~ !is.na(.)))

# Get labels of the variables
labs <- df |>
  select(-id) |>
  get_variable_labels() |>
  enframe(name = "variable", value = "label") |>
  mutate(label = unlist(label))

# Pivot to long format
df_long <- df |>
  pivot_longer(
    cols = -id,
    names_to = "variable",
    values_to = "answer"
  ) |>
  left_join(labs, by = "variable") |>
  mutate(
    answer = remove_val_labels(answer) |>
      factor(
        levels = c(6, 1:5),
        labels = c(
          "I don't know",
          "Always",
          "Often",
          "Sometimes",
          "Rarely",
          "Never"
        )
      )
  )

# Count the answers by variable
df_count <- df_long |>
  count(label, answer) |>
  group_by(label) |>
  mutate(
    total = sum(n),
    perc = n / total,
    perc_label = scales::percent(perc, accuracy = 1),
    text = glue("{n} ({perc_label})")
  )

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Experience with the organization of care and the recurrence of the same healthcare personnel (N={unique(df_count$total)})"
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  mutate(label = str_wrap(label, width = 30)) |>
  ggplot(aes(x = label, y = n, fill = answer)) +
  geom_bar(position = position_stack(), stat = "identity") +
  geom_text(
    aes(label = text),
    position = position_stack(vjust = 0.5),
    size = 4
  ) +
  labs(
    title = str_wrap(caption, width = 35),
    x = NULL,
    y = NULL,
    fill = "Answer"
  ) +
  scale_fill_manual(
    name = NULL,
    values = c(
      "I don't know" = "#B0BEC5",
      "Always" = "#2196F3",
      "Often" = "#8BC34A",
      "Sometimes" = "#FFC107",
      "Rarely" = "#FF9800",
      "Never" = "#F44336"
    )
  ) +
  theme_kce() +
  theme(
    legend.position = "bottom",
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_blank(),
  ) +
  guides(
    fill = guide_legend(title.position = "top", title.hjust = 0, nrow = 2)
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/care_organization_experience.png",
  plot = fig,
  width = 6,
  height = 8,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  width = 6,
  height = 8,
  path = "results/figures/pptx/care_organization_experience.pptx",
  overwrite = TRUE
)
