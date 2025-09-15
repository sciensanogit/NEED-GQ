#' Name         : treatment_timing.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      :
#' Files created: - `results/figures/png/treatment_timing.png`
#'                - `results/figures/pptx/treatment_timing.pptx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)
library(patchwork)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_fr.rds")

# Subset and modify the data
df <- data |>
  filter(lastpage == 16) |>
  select(id, D13, D13b, DSHC1, HC1)

# Create separate datasets for each treatment timing
## diagnosis
df_diag <- df |>
  select(id, D13, D13b) |>
  # Redefine categories for the number of years not working (S3b)
  mutate(
    D13b = ifelse(D13b > 100, NA, D13b), # Exclude abnormal values
    D13b_binned = cut(
      D13b,
      breaks = c(-Inf, 20, Inf),
      labels = c("10-20 years", ">20 years"),
      right = TRUE
    ) |>
      as.character(),
    answer = case_when(
      D13 == 1 ~ "< 6 months",
      D13 == 2 ~ "6m-2y",
      D13 == 3 ~ "2-5 years",
      D13 == 4 ~ "5-10 years",
      D13 == 5 ~ D13b_binned,
      D13 == 6 ~ "I don't know",
      TRUE ~ NA_character_
    )
  ) |>
  filter(!is.na(answer))

# Redefine the D13 levels
lvl_d13 <- c("10-20 years", ">20 years")
lvl_d13 <- lvl_d13[!is.na(lvl_d13)]
df_diag$answer <- factor(
  df_diag$answer,
  levels = c(
    "< 6 months",
    "6m-2y",
    "2-5 years",
    "5-10 years",
    lvl_d13,
    "I don't know"
  )
)

## First symptoms
df_symp <- df |>
  select(id, answer = DSHC1) |>
  mutate(answer = to_factor(answer)) |>
  filter(!is.na(answer)) |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

## First healthcare contact
df_hc <- df |>
  select(id, answer = HC1) |>
  mutate(answer = to_factor(answer)) |>
  filter(!is.na(answer)) |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

# Define caption -----------------------------------------------------------------

caption_diag <- glue("{attr(df$D13, \"label\")} (n = {n_distinct(df_diag$id)})")
caption_symp <- glue(
  "{attr(df$DSHC1, \"label\")} (n = {unique(df_symp$total)})"
)
caption_hc <- glue("{attr(df$HC1, \"label\")} (n = {unique(df_hc$total)})")

# Create the figure --------------------------------------------------------

## Diagnosis
fig_diag <- df_diag |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  ) |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(
    name = "Number of patients",
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(title = str_wrap(caption_diag, 60), x = NULL) +
  theme_kce() +
  see::scale_fill_material() +
  theme(legend.position = "none") +
  guides(fill = guide_legend(nrow = 4))

## First symptoms
fig_symp <- df_symp |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(
    name = "Number of patients",
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(title = str_wrap(caption_symp, 60), x = NULL) +
  theme_kce() +
  see::scale_fill_material() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

## First healthcare contact
fig_hc <- df_hc |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(
    name = "Number of patients",
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(title = str_wrap(caption_hc, 60), x = NULL) +
  theme_kce() +
  see::scale_fill_material() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Combine the three plots into one
fig <- fig_diag / fig_symp / fig_hc

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/treatment_timing.png",
  plot = fig,
  width = 8,
  height = 18,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  width = 8,
  height = 18,
  path = "results/figures/pptx/treatment_timing.pptx",
  overwrite = TRUE
)
