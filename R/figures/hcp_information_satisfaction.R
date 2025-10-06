#' Name         : hcp_information_satisfaction.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      :
#' Files created: - `results/figures/png/hcp_information_satisfaction.png`
#'                - `results/figures/pptx/hcp_information_satisfaction.pptx`
#'                - `data/processed/subdata/hcp_information_satisfaction.rds`
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
  filter(included == 1L) |>
  select(id, answer = HC10) |>
  filter(!is.na(answer)) |>
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

# Turn into numeric scale and save the data
df |>
  mutate(
    answer_num = as.numeric(answer) - 1,
    answer_num = if_else(answer == "I don't know", NA_real_, answer_num)
  ) |>
  select(id, hcp_information_satisfaction = answer_num) |>
  saveRDS("data/processed/subdata/hcp_information_satisfaction.rds")

# Make into a count table
df_count <- df |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Participant satisfaction with information received from HCPs (N={nrow(df)})."
)

# Create the figure --------------------------------------------------------

fig <- ggplot(df_count, aes(x = answer, y = percentage, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  labs(
    title = str_wrap(caption, 70),
    x = NULL,
    y = "Number of patients"
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.3))) +
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
  theme_kce(font_size = 14) +
  theme(
    legend.position = "none",
    panel.grid.major.y = element_line(linewidth = 0.1, color = "grey80")
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/hcp_information_satisfaction.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/hcp_information_satisfaction.pptx",
  overwrite = TRUE
)
