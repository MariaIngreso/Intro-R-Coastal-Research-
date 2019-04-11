# 11 April 2019 
# Tidier data 
# Chapter 11

# Load libraries
library(tidyverse)
library(lubridate)

# Load the dataset
load("data/SACTNmonthly_v4.0.RData")

# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0         # renaming SACTNmonthly_v4.0
rm(SACTNmonthly_v4.0)              # rm - remove function: remove the SACTNmonthly_v4.0 dataset 

# Tidy data
# Filter, mutate, group_by, select, arrange: Found in tidyverse package

SACTN_1 <- SACTN %>% 
  filter(site == "Port Nolloth")   # Only extract Port Nolloth data 

SACTN %>%
  filter(site == "Pollock Beach", 
         month(date) == 12 | 
         month(date) == 1)         # Filtering and restricting for certain months 
                                   # Lubridate package allows for R to only detect the month within the date 
                                   # column
SACTN_arr <- SACTN %>%
  arrange(depth, temp)             # arrange fn: places lowest value to the top of the data set

# Descending order 
SACTN_des <- SACTN %>%
  arrange(desc(temp))              # highest temp and depth to the lowest temp and depth

# FIlter but for specific dates/years
SACTN_Hume <- SACTN %>%
  filter(site == "Humewood", year(date) == 1990)

# Filtering for more than one year
humewood_90s <- SACTN %>%
  filter(site == "Humewood", year(date) %in% seq(1990, 1999, 1))

SACTN_PortN <- SACTN %>%
  filter(site == "Port Nolloth",   # First give the site to filter
         src == "DEA",             # Then specify the source
         temp <= 11 |              # Temperatures at or below 11°C OR
           is.na(temp)             # Include missing values
         )

# Function called select in the tidyverse function 
SACTN_select <- SACTN %>% 
  select(site,src,temp)

SACTN_organised <- SACTN %>% 
  select(temp, src, site)          # Arranging data into the preferred order

SACTN_every <- SACTN %>% 
  select(type, src, everything())

# exploting mutate function 
# Creates a new column called Kelvin
SACTN_mutate <- SACTN %>%
  mutate(kelvin = temp + 273.15)   # 1. give name to new column being created


SACTN_sum <- SACTN %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE),
            min_temp = min(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE)
  )
