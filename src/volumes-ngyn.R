# Monthly volumes of NGYN cases processed by the Cytology Department

# Load Libraries
library(tidyverse)
library(gt)

# import raw data
data_raw <- readxl::read_excel("data/ngyn_raw.xls",
                               skip = 1)

# remove total row
data_raw <- data_raw[1:(nrow(data_raw) - 1), ]

# rename columns from date to month abbreviation
data_raw