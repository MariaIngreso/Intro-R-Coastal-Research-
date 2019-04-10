# 10 April 2019 
# Faceting 
# Using new library called ggpubr
# Here we use the fn ggarrange - found in the ggpubr package

# Load pacakages 
library(tidyverse)
library(ggpubr)

#Load data
ChickWeight <- datasets::ChickWeight

# Create faceted figure
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +                               # Creating points for each observation 
  geom_smooth(method = "lm") +                 # Note the `+` sign here
  facet_wrap(~Diet, ncol = 2) +                # This is the line that creates the facets
  labs(x = "Days", y = "Mass (g)")+            # Labelling the axis
  ggtitle("Facet wrap 1")

# Facet wrapping multiple graphs
# using the fn ggarrange 

ChickLast <- ChickWeight %>%
  filter(Time == 21)

line_1 <- ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick)) +
  labs(x = "Days", y = "Mass (g)")
line_1

# Note that we are using 'ChickLast', not 'ChickWeight'
histogram_1 <- ggplot(data = ChickLast, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) +  # Dodge put the bins next to eachother 
  labs(x = "Final Mass (g)", y = "Count")
histogram_1

# Note that we are using 'ChickLast', not 'ChickWeight'
box_1 <- ggplot(data = ChickLast, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) +
  labs(x = "Diet", y = "Final Mass (g)")
box_1

ggarrange(line_1,histogram_1, box_1,
          ncol = 2, nrow = 2,                        # Set number of rows and columns
          labels = c("A", "B", "C"),                 # Label each figure
          common.legend = TRUE)                      # Create common legend
