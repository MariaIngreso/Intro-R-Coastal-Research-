# 11 April 2019 
# Mapping with Style 

# Load libraries 
library(tidyverse)
library(scales)
library(ggsn)

# Load dataset 
load("data/africa_map.RData")

ggplot() +
  borders() +                    # The global shape file
  coord_equal()                  # Equal sizing for lon/lat

sa_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(12, 36), ylim = c(-38, -22), expand = 0)           # Force lon/lat extent
sa_1

