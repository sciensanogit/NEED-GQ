#' All fuctions for EQ-5D-5L data
library(ggalluvial) |> suppressMessages()

plot_eq5d5l <- function(data, category_name = NULL, caption = NULL) {
  data |>
    count(timepoint, value) |>
    add_count(timepoint, wt = n, name = "total") |>
    mutate(
      perc = n / total,
      label = scales::percent(perc, accuracy = 1, trim = F)
    ) |>
    ggplot(aes(x = timepoint, y = n, fill = value)) +
    geom_bar(position = position_stack(), stat = "identity") +
    geom_text(
      aes(label = label),
      position = position_stack(vjust = 0.5),
      size = 4
    ) +
    labs(
      title = str_wrap(caption, width = 35),
      x = "",
      y = "Number of patients",
      fill = category_name
    ) +
    see::scale_fill_material() +
    theme_kce() +
    theme(
      legend.position = "bottom",
      axis.ticks.x = element_blank(),
    ) +
    guides(
      fill = guide_legend(title.position = "top", title.hjust = 0, nrow = 2)
    )
}

plot_eq5d5l_sankey <- function(data, caption = NULL) {
  # Reshape the data to appropriate format for sankey
  data |>
    ggplot(aes(
      x = timepoint,
      stratum = value,
      alluvium = id,
      fill = value,
      label = value
    )) +
    ggalluvial::geom_flow(stat = "alluvium", lode.guidance = "frontback") +
    ggalluvial::geom_stratum() +
    geom_label(stat = "stratum", size = 3, fill = "white") +
    see::scale_fill_material() +
    theme_void(14) +
    theme(
      axis.text.x = element_text(margin = margin(2, 2, 2, 2)),
      legend.position = "none",
      plot.title = element_text(
        face = "bold",
        size = rel(16 / 14),
        hjust = 0,
        vjust = 1,
        margin = margin(t = 5, b = 7, l = 5, r = 5)
      ),
    ) +
    ggtitle(str_wrap(caption, width = 40))
}

pivot_eq5d5l_data <- function(data, col1, col2) {
  data |>
    filter(lastpage == 16) |>
    select(id, all_of(c(col1, col2))) |>
    mutate(across(-id, labelled::remove_val_labels)) |>
    pivot_longer(
      cols = -id,
      names_to = "timepoint",
      values_to = "value"
    ) |>
    filter(value != 6) |>
    mutate(
      timepoint = case_when(
        timepoint == col1 ~ "Before onset of first symptoms",
        timepoint == col2 ~ "Today"
      ) |>
        factor(levels = c("Before onset of first symptoms", "Today")),
      value = factor(
        value,
        levels = 1:5,
        labels = c(
          "None",
          "Slight",
          "Moderate",
          "Severe",
          "Extreme"
        )
      )
    )
}
