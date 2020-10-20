# Monthly volumes of NGYN cases processed by the Cytology Department

# Load Libraries
library(tidyverse)
library(lubridate)
library(gt)

# import raw data
data_raw <- readxl::read_excel("data/ngyn_raw.xls",
                               skip = 1)

# remove total row & rename first column and extract sequence groups
data_raw <- data_raw[1:(nrow(data_raw) - 1), ] %>% 
  rename(seq_group = `...1`) %>% 
  mutate(
    seq_group = str_match(
      seq_group, "(?<=\\().+?(?=\\))"
    )
  )

# pivot data to long form and extract month and year into new columns
data_long <- 
  data_raw %>% 
  pivot_longer(
    !seq_group,
    names_to = "Date",
    values_to = "cases",
    values_drop_na = TRUE
  ) %>% 
  mutate(
    Date = mdy(Date),
    yr = year(Date),
    mth = month(Date, label = TRUE, abbr = TRUE),
    location = case_when(
      seq_group == "CPMC" ~ "spl",
      seq_group == "EPMC" ~ "spl",
      seq_group == "HC" ~ "spl",
      seq_group == "OCH" ~ "spl",
      seq_group == "SP" ~ "spl",
      seq_group == "SRMC" ~ "spl",
      seq_group == "BFCMC" ~ "ncmc",
      seq_group == "EMCH" ~ "ncmc",
      seq_group == "NCMC" ~ "ncmc",
      seq_group == "McKee" ~ "mckee",
      seq_group == "MCR" ~ "mcr",
      seq_group == "PVH" ~ "pvh",
      seq_group == "UCHGH" ~ "uchgh",
      seq_group == "IMH" ~ "imh",
      seq_group == "PCMH" ~ "spwy",
      seq_group == "CRMC" ~ "spwy",
      seq_group == "MHCC DC" ~ "spwy",
      seq_group == "KHS" ~ "spwy",
      seq_group == "SPWY" ~ "spwy",
      seq_group == "RAWLINS" ~ "spwy",
      seq_group == "TORRINGTON" ~ "spwy",
      seq_group == "WY VA" ~ "spwy",
      seq_group == "PEAK" ~ "mhn",
      TRUE ~ "-"
    )
  ) %>% 
  filter(location != "-") %>% 
  group_by(location) %>% 
  ungroup()
