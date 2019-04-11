# 11 April 2019
# Plotting with boot 
# Using the third variable as a colour variation (colour scale)

# Load libraries 
library(tidyverse)
library(boot)

# Load built- in dataset
# Explore the dataset
urine <- boot::urine          # Assign name to appear in environment
head(urine)                   # first 6 rows
tail(urine)                   # last 6 rows 
dim(urine)                    # dimesions of data 
names(urine)
colnames(urine)
rownames(urine)

# ggplots : plotting fn in R 

ggplot(urine, aes(x = osmo, y = ph)) +            # ggplot - plotting/specify axis
  geom_point(aes(colour=cond))                    # cond - variable in dataset 
?urine                                            # Background of the dataset 

ggplot(urine, aes(x = osmo, y = ph))+
  geom_point(aes(colour = as.factor(r)))

# To create own colour pallete
# • http://tristen.ca/hcl-picker/#/hlc/6/0.95/48B4B6/345363
# • http://tools.medialab.sciences-po.fr/iwanthue/index.php
# • http://jsfiddle.net/d6wXV/6/embedded/result/
