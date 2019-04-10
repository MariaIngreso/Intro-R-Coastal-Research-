# 10 April 2019
# Here we are plotting ggplot 
# First plots 

# Loading libraries 
library(tidyverse)                # Blanket package
OR
library(ggplot2)                  # More specific to plotting


# Load data 
# R has built in datasets
ChickWeight <- datasets::ChickWeight

summary(ChickWeight)
names(ChickWeight)
dim(ChickWeight)
glimpse(ChickWeight)

# Create a basic figure
# Create a scatter and line graph 
# ?ChickWeight                      # Find out more about the dataset

ggplot(data = ChickWeight, aes(x = Time, y = weight)) +                # Specify data: x-axis and y-axis 
  geom_point() +                    # Scatter plot or point plot 
  geom_line(aes(group = Chick))     # or each chick in the dataset 

# the group fn when plotting is he same as the "group_by" fn 
# Use + and not %>% when plotting


ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) + # Specify each othe diets is a diff. clour 
  geom_point() +
  geom_line(aes(group = Chick))

# Hypothesis: what is the most effective diet? 

ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +              # Plotting points
  geom_smooth(method = "lm")  # lm : Linear model : 1 line fo best fit 

