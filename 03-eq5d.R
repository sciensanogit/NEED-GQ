## libraries
library(dplyr)
library(tidyr)

## get valueset for Belgium
load("data/EQ5D5L_value_set.Rdata")

## calculate the value set based on replies
col_before <- paste0("H", 1:5)
col_today <- paste0("H", 7:11)

data <- data %>%
  mutate(across(all_of(col_before), ~ as.integer(factor(.x)))) %>%
  mutate(code_before = apply(select(., all_of(col_before)), 1, paste0, collapse = ""))

data <- data %>%
  mutate(across(all_of(col_today), ~ as.integer(factor(.x)))) %>%
  mutate(code_today = apply(select(., all_of(col_today)), 1, paste0, collapse = ""))

data <- left_join(
  data, 
  select(value.set, state_string, value_before = value), 
  by = c("code_before" = "state_string")
  )

data <- left_join(
  data, 
  select(value.set, state_string, value_today = value), 
  by = c("code_today" = "state_string")
)


