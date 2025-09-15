#' Name         : impact_work.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Figure of the number of months/years the patient could not work
#'                because of their illness. There are 2 patients with abnormal values:
#'                one with 20412 years, the other with 320. They are excluded from the
#'                figure.
#' Files created: - `results/figures/png/impact_work.png`
#'                - `results/figures/pptx/impact_work.pptx`
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
  select(id, S2, S3, S3b) |>
  # Redefine categories for the number of years not working (S3b)
  mutate(
    S2 = to_factor(S2),
    S3b = ifelse(S3b > 100, NA, S3b), # Exclude abnormal values
    S3b_binned = cut(
      S3b,
      breaks = c(-Inf, 5, 10, 20, Inf),
      labels = c("1-5 years", "6-10 years", "11-20 years", ">20 years"),
      right = TRUE
    ) |>
      as.character(),
    answer = case_when(
      S3 == 1 ~ "< 1 month",
      S3 == 2 ~ "1-3 months",
      S3 == 3 ~ "4-12 months",
      S3 == 4 ~ S3b_binned,
      S3 == 5 ~ "I don't know",
      TRUE ~ NA_character_
    )
  )

# Redefine the S3 levels
levels_s3b <- unique(df$S3b_binned)
levels_s3b <- levels_s3b[!is.na(levels_s3b)]
df$answer <- factor(
  df$answer,
  levels = c(
    "< 1 month",
    "1-3 months",
    "4-12 months",
    levels_s3b,
    "I don't know"
  )
)

# Define the count table for S2
df_s2 <- df |>
  filter(!is.na(S2)) |>
  count(S2) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

# Define the count table for S3
df_s3 <- df |>
  filter(!is.na(answer)) |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

# Define caption -----------------------------------------------------------------

caption <- glue("Impact of the psychosis disorder on work.")

# Create the figure --------------------------------------------------------

# Caption for question S2
caption_s2 <- glue("Global impact (N={unique(df_s2$total)})")

# Figure for question S2
(fig1 <- df_s2 |>
  ggplot(aes(x = S2, y = n, fill = S2)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(
    name = "Number of patients",
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(title = caption, subtitle = str_wrap(caption_s2, 70)) +
  theme_kce() +
  see::scale_fill_material(name = NULL) +
  theme(
    legend.position = "bottom",
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.x = element_blank()
  ) +
  guides(fill = guide_legend(nrow = 4)))

# Caption for question S3
caption_s3 <- glue(
  "Time not working because of the illness (N={unique(df_s3$total)})."
)

# Figure for question S3
(fig2 <- df_s3 |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(
    name = "Number of patients",
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(title = caption, subtitle = str_wrap(caption_s3, 70), x = NULL) +
  theme_kce() +
  see::scale_fill_material() +
  theme(legend.position = "none") +
  guides(fill = guide_legend(nrow = 4)))

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/impact_work_s2.png",
  plot = fig1,
  width = 8,
  height = 6,
  dpi = 300
)
ggsave(
  filename = "results/figures/png/impact_work_s3.png",
  plot = fig2,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig1,
  path = "results/figures/pptx/impact_work_s2.pptx",
  overwrite = TRUE
)
create_pptx(
  ggobj = fig2,
  path = "results/figures/pptx/impact_work_s3.pptx",
  overwrite = TRUE
)
