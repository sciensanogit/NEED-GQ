#' Name         : treatment_choice_involvement.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      :
#' Files created: - `results/figures/png/treatment_choice_involvement.png`
#'                - `results/figures/pptx/treatment_choice_involvement.pptx`
#'               - `data/processed/subdata/treatment_choice_involvement.rds`
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
  select(id, answer = HC11) |>
  filter(!is.na(answer)) |>
  mutate(
    answer = remove_val_labels(answer) |>
      factor(
        levels = c(7, 6, 1:5),
        labels = str_wrap(
          c(
            "I don't know",
            "Not applicable",
            "No, but I didn't want to be involved",
            "No, definitely not",
            "No, not really",
            "Yes, to some extent",
            "Yes, definitely"
          ),
          20
        )
      )
  )

# Turn into numeric scale and save the data
df |>
  mutate(
    answer_num = as.numeric(answer) - 2,
    answer_num = if_else(
      answer %in% c("I don't know", "Not applicable"),
      NA_real_,
      answer_num
    )
  ) |>
  select(id, treatment_choice_involvement = answer_num) |>
  saveRDS("data/processed/subdata/treatment_choice_involvement.rds")

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

caption <- glue("Level of involvement in treatment choice (N={nrow(df)}).")

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(x = answer, y = percentage, fill = answer)) +
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
      "Not applicable" = "#B0BEC5",
      "Yes, definitely" = "#2196F3",
      "Yes, to some extent" = "#8BC34A",
      "No, not really" = "#FFC107",
      "No, definitely not" = "#FF9800",
      "No, but I didn't\nwant to be involved" = "#F44336"
    )
  ) +
  theme_kce(font_size = 14) +
  theme(
    legend.position = "none",
    panel.grid.major.y = element_line(linewidth = 0.1, color = "grey80"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )


# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/treatment_choice_involvement.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/treatment_choice_involvement.pptx",
  overwrite = TRUE
)
