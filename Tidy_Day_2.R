# 11 April 2019 
# Working with Tidy data 
# Long is better than wide data
# Mainly focus on tidyverse package 

# Load libraries 
library(tidyverse)

# Load dataset
load("data/SACTN_mangled.RData")                        # 5 different dataframes in this dataset 

ggplot(data = SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) +
  labs(x = "", y = "Temperature (°C)", colour = "Site") +
  theme_bw()
 
# Gather function in R
# Part of the tidyverse package 

SACTN2_tidy <- SACTN2 %>%                                  # Loading the dataset 
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp")    # Gathering 3 variables & creating a new column
                                                           # new column is called 'src'
                                                           # below 'src' variabe name - have various sources
                                                           # i.e. DEA, KZNSB & SAWS. 
                                                           # then, created new column ('temp') with values 
                                                           # values come from DEA, KZNSB and SAWS

# Here we remove the NA values
SACTN2_tidy <- SACTN2 %>%                                   
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") %>% 
  na.omit()

# Spreading
SACTN3_tidy <- SACTN3 %>%
  spread(key = var, value = val)

# Spreading and uniting 
SACTN4a_tidy <- SACTN4a %>%
  separate(col = index, into = c("site", "src"), sep = "/ ")  # Separate column called index into 2 columns
                                                              # site and src 
                                                              # the index column separates site and source with \
# Unite 
SACTN4b_tidy <- SACTN4b %>%
  unite(year, month, day, col = "date", sep = "-")            # Unite year, month and day 
                                                              # put it under column date 
                                                              # sep - separate the date with "-"
# Joining 2 datasets
SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)
 
# Joining by "site" and "src"  and "date" 


