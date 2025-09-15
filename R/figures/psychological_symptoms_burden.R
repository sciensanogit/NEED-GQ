#' Name         : psychological_symptoms_burden.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create the figure for psychological symptoms burden using variables
#'                H13_SQ* from the dataset. Using French data
#' Files created: - `results/figures/png/psychological_symptoms_burden.png`
#'                - `results/figures/pptx/psychological_symptoms_burden.pptx`
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

# Select variables of interest and patients who completed the questionnaire
df <- data |>
  filter(lastpage == 16) |>
  select(id, starts_with("H13_SQ"))

# Extract labels
labs <- get_labels(df, include = -id)

# Reshape data and add labels
df_long <- df |>
  pivot_longer(
    cols = starts_with("H13_SQ"),
    names_to = "question",
    values_to = "response"
  ) |>
  left_join(labs, by = c("question" = "variable")) |>
  mutate(response = to_factor(response)) |>
  filter(!is.na(response))

n_total <- n_distinct(df_long$id)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Frequency, distribution and level of burden of psychological symptoms reported by respondents (N={n_total}). Participants could select multiple options; values represent the number of responses, not individual participants."
)

# Create the figure --------------------------------------------------------

(fig <- df_long |>
  count(label, response) |>
  ggplot(aes(x = n, y = label, fill = response)) +
  geom_col(position = "stack") +
  scale_x_continuous(
    breaks = scales::breaks_width(width = 10),
    expand = expansion(mult = c(0, 0))
  ) +
  see::scale_fill_material(name = "", na.translate = F) +
  scale_y_discrete(
    labels = function(x) str_wrap(x, width = 50) # Wrap long labels
  ) +
  labs(
    y = "",
    x = "Number of responses",
    title = caption |> str_wrap(50)
  ) +
  theme_kce(font_size = 10) +
  theme(
    panel.grid.major.x = element_line(colour = "lightgray"),
    legend.position = "bottom"
  ) +
  guides(fill = guide_legend(nrow = 3)))

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/psychological_symptoms_burden.png",
  plot = fig,
  width = 8,
  height = 10,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  width = 8,
  height = 10,
  path = "results/figures/pptx/psychological_symptoms_burden.pptx",
  overwrite = TRUE
)
