#' Name         : forgone_care_causes_yn.R
#' Author       : Alexandre Bohyn
#' Date         : 10 October 2025
#' Purpose      : description
#' Files created: `output/figures/forgone_care_causes_yn.R.png/pdf`
#' Edits        :
#'  - 10 October 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset to relevant columns and filter to last survey only
df <- data |>
  filter(included == 1L) |>
  select(id, HC12) |>
  filter(!is.na(HC12)) |> # Remove missing values
  mutate(HC12 = to_factor(HC12)) # Convert to factor with labels

# Count the number of responses per diagnosis
df_count <- df |>
  count(HC12, name = "n") |>
  mutate(
    perc = n / nrow(df),
    text_label = glue("{n} ({scales::percent(perc, accuracy = 1)})")
  ) |>
  arrange(desc(n))

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Forgone care (N={nrow(df)})."
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(y = HC12, x = n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = text_label), hjust = -0.25, size = 5) +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 5),
    expand = expansion(mult = c(0, 0.4))
  ) +
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
    panel.grid.major.x = element_line(colour = "lightgray")
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/forgone_care_causes_yn.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/forgone_care_causes_yn.pptx",
  overwrite = TRUE
)
