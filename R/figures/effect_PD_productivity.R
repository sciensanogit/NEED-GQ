#' Name         : effect_PD_productivity
#' Author       : Alexandre Bohyn
#' Date         : 18 December 2025
#' Purpose      : description
#' Files created: `results/figures/effect_PD_productivity.png/pdf`
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
  select(S4_SQ001) |>
  filter(!is.na(S4_SQ001))

caption <- glue::glue(
  "Over the past seven days, to what extent has the psychotic disorder affected your productivity while working? (n = {nrow(df)})"
)
stat_footnote <- glue::glue(
  "Mean response: {round(mean(df$S4_SQ001), 2)}; SD: {round(sd(df$S4_SQ001), 2)}; ",
  "Median: {median(df$S4_SQ001)}; IQR: ({quantile(df$S4_SQ001, 0.25)}, {quantile(df$S4_SQ001, 0.75)})"
)

# Generate figure ---------------------------------------------------------

fig <- ggplot(df, aes(x = S4_SQ001)) +
  geom_histogram(binwidth = 0.5, fill = "steelblue") +
  labs(
    x = "Effect of psychotic disorder on productivity",
    y = "Count",
    title = str_wrap(caption, width = 60),
    caption = stat_footnote
  ) +
  scale_x_continuous(breaks = 0:10) +
  theme_kce(font_size = 12) +
  theme(
    panel.grid.major.y = element_line(colour = "lightgray")
  )

# Save figure -------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/effect_PD_productivity.png",
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
  path = "results/figures/pptx/effect_PD_productivity.pptx",
  overwrite = TRUE
)
