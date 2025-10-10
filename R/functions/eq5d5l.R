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
      y = "Number of respondents",
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
    mutate(timepoint = str_wrap(timepoint, width = 20)) |>
    ggplot(aes(
      x = timepoint,
      stratum = value,
      alluvium = id,
      fill = value,
      label = value
    )) +
    ggalluvial::geom_flow(stat = "alluvium", lode.guidance = "frontback") +
    ggalluvial::geom_stratum() +
    geom_text(
      stat = "stratum",
      aes(
        label = ifelse(
          after_stat(prop) <= 0.045,
          "*",
          glue::glue(
            "{scales::percent(after_stat(prop), accuracy = 1)} ({after_stat(count)})"
          )
        )
      )
    ) +
    scale_fill_manual(
      name = "Level",
      values = c(
        "I don't know" = "#B0BEC5",
        "None" = "#2196F3",
        "Slight" = "#4CAF50",
        "Moderate" = "#FFC107",
        "Severe" = "#FF9800",
        "Extreme" = "#F44336"
      )
    ) +
    scale_x_discrete(expand = expansion(mult = 0.3)) +
    theme_void(14) +
    theme(
      axis.text.x = element_text(margin = margin(3, 3, 3, 3)),
      plot.title = element_text(
        face = "bold",
        size = rel(16 / 14),
        hjust = 0,
        vjust = 1,
        margin = margin(t = 5, b = 7, l = 5, r = 5)
      ),
      legend.box.margin = margin(0, 15, 0, 0)
    ) +
    labs(caption = "* < 5%") +
    ggtitle(str_wrap(caption, width = 40))
}

pivot_eq5d5l_data <- function(data, col1, col2) {
  data |>
    filter(included == 1L) |>
    select(id, all_of(c(col1, col2))) |>
    mutate(across(-id, labelled::remove_val_labels)) |>
    filter(!(is.na(.data[[col1]]) & is.na(.data[[col2]]))) |>
    pivot_longer(
      cols = -id,
      names_to = "timepoint",
      values_to = "value"
    ) |>
    mutate(
      timepoint = case_when(
        timepoint == col1 ~ "Before onset of first symptoms",
        timepoint == col2 ~ "Today"
      ) |>
        factor(levels = c("Before onset of first symptoms", "Today")),
      value = factor(
        value,
        levels = c(6, 1:5),
        labels = c(
          "I don't know",
          "None",
          "Slight",
          "Moderate",
          "Severe",
          "Extreme"
        )
      ),
      value_num = as.numeric(value) - 1, # Numeric version for statistical tests
      value_num = ifelse(value == 0, NA, value_num) # Replace 0 (I don't know) by NA
    )
}
