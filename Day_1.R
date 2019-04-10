# 10 April 2019
# Day 1 - Intro to R
# UWC
# Maria Ingreso

apples <- c(5.3,7.8,19.4,1)
mean(apples)
sd(apples)
dim(apples)               # dimensions = NULL, not a dataframe 
length(apples)
range(apples)
median(apples)
min(apples)
max(apples)

# Libraries 
library(tidyverse)

# Reading a dataset into R 
library(readr)
laminaria <- read_csv("data/laminaria.csv")     # Using the Laminaria data found in the data folder
#View(laminaria) 

dim(laminaria) # 140 rows 12 columns
mean(laminaria) # Cannot use mean fn on a dataframe

# Calculate mean of blade_weight and blade_length 
# %>% ctrl+shift+n (Pipe fn)

lam_sum <- laminaria %>%                           # Specify the dataset
  summarise(mean_wt = mean(blade_weight),          # Calculate mean of blade weight 
            mean_bl = mean(blade_length))          # Calculate mean of blade length 

# Explore data - Laminaria dataset

head(laminaria)                                    # First 6 rows of the dataset
tail(laminaria)                                    # Last 6 rows of the dataset 
head(laminaria, n = 2)                             # Shows first 2 rows of the dataset
tail(laminaria, n = 2)                             # Shows last 2 rows of the dataset


names(laminaria)                                  
colnames(laminaria)

nrow(laminaria)                                    # Shows amounf of rows in the dataset 
ncol(laminaria)                                    # Shows amounf of columns in the dataset

lam_2 <- laminaria %>%                             # Specify dataset
  select(blade_weight,blade_length,site)           # Selectine specifc columns

lam_3 = laminaria %>% 
  filter(site == "Sea Poinr") %>% 
  summarise(mean_wt = mean(blade_weight),    # mean BW of the oe sigh
            mean_bl = mean(blade_length),    # mean BL at the one site
            sc_bl = sd(blade_length))        # sd of BL 


# Fn within tidyverse: slice

lam_slice = laminaria %>% 
  slice(6:13)

# Dealing with missing values 
lam_miss <- laminaria%>%
  summarise(mean_sm = mean(stipe_mass))      # mean on stipe mass 
# get an NA answer beacause of NA values in the dataset 

lam_miss <- laminaria%>%
  summarise(mean_sm = mean(stipe_mass, na.rm = T))

# Calculate the standard error

laminaria %>%                                # Select 'laminaria'
  group_by(site) %>%                         # Group the dataframe by site
  summarise(var_bl = var(blade_length),      # Calculate variance
            n_bl = n()) %>%                  # Count number of values
  mutate(se_bl = sqrt(var_bl / n_bl))        # Calculate se


# Visualisations 

# Plotting in R - ggplot
# 1. Specify data set 
# 2. Specify the axis variables 
# ggplot : instead of %>% , use + 

ggplot(data = laminaria, aes(x = stipe_mass, y = stipe_length)) +
  geom_point(shape = 21, colour = "salmon", fill = "white") +
  labs(x = "Stipe mass (kg)", y = "Stipe length (cm)")



