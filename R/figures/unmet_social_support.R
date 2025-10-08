#' Name         : unmet_social_support.R
#' Author       : Alexandre Bohyn
#' Date         : 22 September 2025
#' Purpose      : description
#' Files created: `output/figures/unmet_social_support.R.png/pdf`
#' Edits        :
#'  - 22 September 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)

# Load all functions
purrr::walk(list.files("R/functions", full.names = TRUE), source)

# Load data ----------------------------------------------------------------------

data <- readRDS("data/processed/data_current.rds")

# Subset included patients and relevant variables
df <- data |>
  filter(included == 1L) |>
  select(id, matches("S7_SQ*"))

# Retrieve labels
lbl_list <- map_chr(df[, -1], function(x) attr(x, "label")) |>
  str_extract("(?<=\\[).*(?=\\])") |>
  setNames(names(df)[-1]) |>
  as.list()

# Pivot to long format and add the labels
df_long <- df |>
  pivot_longer(-id, names_to = "question", values_to = "response") |>
  mutate(
    label = recode(question, !!!lbl_list) |>
      factor(levels = unlist(lbl_list))
  ) |>
  filter(response == 1)

# Save the processed data
df_long |>
  mutate(response_num = as.numeric(response)) |>
  select(id, question, response_num) |>
  pivot_wider(names_from = question, values_from = response_num) |>
  set_variable_labels(
    .labels = distinct(df_long, question, label) |>
      mutate(label = as.character(label)) |>
      deframe() |>
      as.list()
  ) |>
  write_rds("data/processed/subdata/unmet_social_support.rds")

# Summarise data
df_long <- df_long |>
  count(label) |>
  mutate(
    label = fct_reorder(label, n) |>
      fct_relevel(unname(lbl_list[[11]]), after = 0) |> # Move "I don't know" to the first
      fct_relabel(~ str_wrap(., width = 40)), # Wrap long labels
    perc = n / sum(n),
    text_lab = glue("{n} ({scales::percent(perc, accuracy = 1)})")
  )

caption <- glue(
  "Needs for social support that was not received (N = {nrow(df)})"
)

# Create figure ------------------------------------------------------------------

(fig <- ggplot(df_long, aes(y = label, x = n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = text_lab), hjust = -0.1) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.3))) +
  labs(
    title = str_wrap(caption, width = 40),
    y = NULL,
    x = "Number of patients"
  ) +
  theme_kce())

# Save figure --------------------------------------------------------------

# To PNG
ggsave(
  "results/figures/png/unmet_social_support.png",
  fig,
  width = 8,
  height = 6
)

# To powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/unmet_social_support.pptx",
  width = 8,
  height = 6
)
