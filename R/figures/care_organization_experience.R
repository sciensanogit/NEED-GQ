#' Name         : care_organization_experience.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create a bar chart of the care organization experience for questions
#'               HC7, HC8, HC9.
#' Files created: - `results/figures/png/care_organization_experience.png`
#'                - `results/figures/pptx/care_organization_experience.pptx`
#'                - `data/processed/subdata/care_organization_experience_data.rds`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset and keep only the relevant variables
df <- data |>
  filter(included == 1L) |>
  select(id, HC7, HC9) |>
  filter(!if_all(matches("^HC.+$"), is.na)) # Remove rows with all missing values

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

# Save the processed data
df_long |>
  select(id, variable, answer) |>
  mutate(
    answer_num = as.numeric(answer),
    answer_num = ifelse(answer_num == 6, NA, answer_num) # Convert "I don't know" to NA
  ) |>
  select(-answer) |>
  pivot_wider(names_from = variable, values_from = answer_num) |>
  saveRDS("data/processed/subdata/care_organization_experience_data.rds")

# Count the answers by variable
df_count <- df_long |>
  filter(answer != "I don't know") |>
  count(label, answer) |>
  group_by(label) |>
  mutate(
    total = sum(n),
    perc = n / total,
    perc_label = scales::percent(perc, accuracy = 1),
    text = glue("{n}\n({perc_label})")
  ) |>
  mutate(
    answer = fct_rev(answer),
    label = glue::glue("{label} (N={total})")
  )

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Experience with the organization of care and the recurrence of the same healthcare personnel"
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = text), vjust = -0.5, size = 4) +
  scale_y_continuous(
    name = "Number of respondents",
    expand = expansion(mult = c(0, 0.3))
  ) +
  labs(title = str_wrap(caption, 60), x = NULL) +
  theme_kce() +
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
  facet_wrap(
    . ~ label,
    labeller = labeller(label = function(x) str_wrap(x, width = 40))
  ) +
  theme(legend.position = "none") +
  guides(fill = guide_legend(nrow = 4))

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/care_organization_experience.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  width = 8,
  height = 6,
  path = "results/figures/pptx/care_organization_experience.pptx",
  overwrite = TRUE
)
