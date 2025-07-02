## libraries
library(rtables)
library(tern)
library(rlang)
library(cardinal)
library(rtables.officer)

## table format (can be adapted)
format_table <- c("mean_sd" = "xx.xx (xx.xx)",
                  "range" = "xx.xx - xx.xx",
                  "median" = "xx.xx",
                  "count_fraction" = "xx (xx.xx%)")

## General demographics
## .. sex
## .. age
## .. province
## .. diploma
## .. country of birth

## create dataset
df <- data[which(colnames(data) %in% c("D2", "D3", "D4", "D5", "D7"))]
names(df) <- attributes(data)$variable.labels[which(colnames(data) %in% c("D2", "D3", "D4", "D5", "D7"))]
df$Study <- factor("Need")

## calculate age
df$`Quelle est votre année de naissance ?` <-
  as.numeric(format(Sys.Date(), "%Y")) - df$`Quelle est votre année de naissance ?`

## build basic table
basic_table() %>%
  split_cols_by("Study") %>%
  analyze_vars(
    names(df), .formats = format_table) %>%
  add_colcounts() %>%
  add_overall_col("All") %>%
  build_table(df)

