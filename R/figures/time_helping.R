#' Name         : time_helping
#' Author       : Alexandre Bohyn
#' Date         : 18 December 2025
#' Purpose      : description
#' Files created: `results/figures/time_helping.png/pdf`
#' Edits        :
#'  - 18 December 2025: Created file.

# Packages ----------------------------------------------------------------

library(dplyr)
library(ggplot2)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset the data
df <- data |>
  filter(included == 1L) |>
  select(answer = CG5) |>
  filter(!is.na(answer))

caption <- glue::glue(
  "Last week, how much time did you spend helping the person with activities they would normally have done themselves if they were in good health? (n = {nrow(df)})"
)
stat_footnote <- glue::glue(
  "Mean response: {me}; SD: {s}; Median: {md}; IQR: ({q1}, {q2})",
  me = round(mean(df$answer, na.rm = TRUE), 2),
  s = round(sd(df$answer, na.rm = TRUE), 2),
  md = median(df$answer, na.rm = TRUE),
  q1 = quantile(df$answer, 0.25, na.rm = TRUE),
  q2 = quantile(df$answer, 0.75, na.rm = TRUE)
)

# Generate figure ---------------------------------------------------------

fig <- ggplot(df, aes(x = answer)) +
  geom_histogram(binwidth = 10, fill = "steelblue", color = "black", linewidth = 0.2) +
  labs(
    x = "Time spent helping (hours)",
    y = "Count",
    title = str_wrap(caption, width = 60),
    caption = stat_footnote
  ) +
    scale_x_continuous(breaks = seq(0, 150, 10)) +
  theme_kce(font_size = 12) +
  theme(
    panel.grid.major.y = element_line(colour = "lightgray")
  )

# Save figure -------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/time_helping.png",
  plot = fig,
  width = 6,
  height = 4,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  width = 6,
  height = 4,
  path = "results/figures/pptx/time_helping.pptx",
  overwrite = TRUE
)
