#' Name         : treatment_burden
#' Author       : Alexandre Bohyn
#' Date         : 18 December 2025
#' Purpose      : description
#' Files created: `results/figures/treatment_burden.png/pdf`
#' Edits        :
#'  - 18 December 2025: Created file.

library(tidyverse)
library(glue)
library(labelled)
library(patchwork)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset and modify the data
df <- data |>
  filter(included == 1L) |>
  select(id, HC6)

# Treatment burden data set
df_hc <- df |>
  dplyr::select(id, answer = HC6) |>
  filter(!is.na(answer)) |>
  mutate(
    answer = haven::as_factor(answer) |>
      fct_relevel("I don't know", after = 0)
  ) |>
  filter(!is.na(answer)) |>
  filter(!c(answer %in% c("I don't know", "Not applicable"))) |>
  mutate(
    answer_num = as.numeric(answer) - 1
  )

# Save the intermediate data
df_hc |>
  select(id, treatment_burden = answer_num) |>
  saveRDS("data/processed/subdata/treatment_burden.rds")

# summarize the total number of unique respondents
df_hc <- df_hc |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

# Define caption -----------------------------------------------------------------

caption_hc <- glue(
  " Apart from side effects, how burdensome was the treatment you received for the psychotic disorder in the past 5 years? (n = {unique(df_hc$total)})"
)

# Create the figure --------------------------------------------------------

fig_hc <- df_hc |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(
    name = "Number of respondents",
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(title = str_wrap(caption_hc, 60), x = NULL) +
  theme_kce() +
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
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/treatment_burden.png",
  plot = fig_hc,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig_hc,
  width = 8,
  height = 6,
  path = "results/figures/pptx/treatment_burden.pptx",
  overwrite = TRUE
)
