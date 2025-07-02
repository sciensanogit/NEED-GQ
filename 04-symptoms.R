## libraries
library(rtables)
library(tern)
library(rlang)
library(cardinal)
library(rtables.officer)
library(stringr)

## table format (can be adapted)
format_table <- c("mean_sd" = "xx.xx (xx.xx)",
                  "range" = "xx.xx - xx.xx",
                  "median" = "xx.xx",
                  "count_fraction" = "xx (xx.xx%)")

## Symptoms
## .. create dataset
df <- data[which(colnames(data) %in% c(paste0("D15_", 1:15)))]
names(df) <- attributes(data)$variable.labels[which(colnames(data) %in% c(paste0("D15_", 1:15)))]

## .. change name
extracted <- str_extract(names(df), "\\[.*?\\]")
extracted_clean <- str_remove_all(extracted, "\\[|\\]")
names(df) <- extracted_clean

df$Study <- factor("Need")

## build basic table
basic_table() %>%
  split_cols_by("Study") %>%
  analyze_vars(
    names(df), .formats = format_table) %>%
  add_colcounts() %>%
  add_overall_col("All") %>%
  build_table(df)
