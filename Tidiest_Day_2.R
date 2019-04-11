# 11 April 2019 
# Chapter 12

# Load libraries 
library(lubridate)
library(tidyverse)

# Load dataset 
load("data/SACTNmonthly_v4.0.RData")

# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0

# Remove the original
rm(SACTNmonthly_v4.0)

# group_by fn 
SACTN_depth <- SACTN %>%
  group_by(depth)

SACTN_depth_mean_2 <- SACTN %>%                     # Choose a base dataframe
  group_by(depth) %>%                               # Group by thedepth column
  summarise(mean_temp = mean(temp, na.rm = TRUE),   # Calculate means
            count = n()                             # Count observations
  )                                                 # Safety measure




# Exploring all the tidyverse functions in 1 chuncck  of code
SACTN %>%
  filter(site == "Paternoster" | site == "Oudekraal") %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))

# Working with multiple site but not all

# First create a character vector containing the desired sites

selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood")
SACTN_selected <- SACTN %>%
  filter(site %in% selected_sites) %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))












