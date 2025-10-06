#' Name         : eq5d5l_health_score.R
#' Author       : Alexandre Bohyn
#' Date         : September 12, 2025
#' Purpose      : Create a facetted bar plot of EQ-5D-5L health overall score before the
#'                onset of first symptoms and today.
#' Files created: - `results/figures/png/eq5d5l_health_score.png`
#'                - `results/figures/pptx/eq5d5l_health_score.pptx`
#'                - `data/processed/subdata/eq5d5l_health_score.rds`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_fr.rds")

# Subset patients that finished the survey and EQ-5D-5L questions
df <- data |>
  filter(included == 1L) |>
  select(id, H6, H12)

# Pivot to long format and label the time points
df_long <- df |>
  mutate(change = H12 - H6) |>
  pivot_longer(
    cols = c(H6, H12),
    names_to = "timepoint",
    values_to = "health_score"
  ) |>
  mutate(
    timepoint = case_when(
      timepoint == "H6" ~ "Before onset of first symptoms",
      timepoint == "H12" ~ "Today"
    ),
    timepoint = factor(
      timepoint,
      levels = c("Before onset of first symptoms", "Today")
    )
  )

# Save the long data frame for future use
df_long |>
  distinct(id, change) |>
  rename(eq5d5l_health_score = change) |>
  saveRDS("data/processed/subdata/eq5d5l_health_score.rds")

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Changes in general health score of the EQ-5D-5L before onset of first symptoms and today (N={nrow(df)})"
)

# Create the figure --------------------------------------------------------

# Test for difference in distribution
wilcox_test <- wilcox.test(
  health_score ~ timepoint,
  data = df_long,
)

# Summary statistics data frame
summ_df <- df_long |>
  group_by(timepoint) |>
  summarise(
    median = median(health_score, na.rm = TRUE),
    p25 = quantile(health_score, 0.25, na.rm = TRUE),
    p75 = quantile(health_score, 0.75, na.rm = TRUE),
    .groups = "drop"
  ) |>
  pivot_longer(
    cols = -timepoint,
    names_to = "statistic",
    values_to = "value"
  ) |>
  mutate(
    statistic = case_when(
      statistic == "median" ~ "Median",
      statistic == "p25" ~ "Q1",
      statistic == "p75" ~ "Q3"
    ),
    label = glue("{statistic}: {value}") |>
      str_pad(10, side = "left", pad = " ")
  )

# Figure
(fig <- df_long |>
  filter(!is.na(health_score)) |>
  ggplot(aes(x = timepoint, y = health_score)) +
  geom_boxplot(aes(fill = timepoint), width = 0.3, outlier.shape = NA) +
  geom_point(position = position_jitter(width = 0.01)) +
  see::scale_fill_material_d(
    na.translate = FALSE
  ) +
  geom_text(
    data = summ_df,
    aes(x = timepoint, y = value, label = label),
    inherit.aes = FALSE,
    size = 4.5,
    vjust = 0.5,
    hjust = -1,
    nudge_x = -0.1
  ) +
  labs(
    title = str_wrap(caption, width = 70),
    x = "",
    y = "Health Score",
    caption = glue(
      "Wilcoxon signed-rank test: {scales::pvalue(wilcox_test$p.value, add_p = T)}"
    )
  ) +
  theme_kce(font_size = 14) +
  theme(legend.position = "bottom") +
  guides(fill = "none"))

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/eq5d5l_health_score.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/eq5d5l_health_score.pptx",
  overwrite = TRUE
)
