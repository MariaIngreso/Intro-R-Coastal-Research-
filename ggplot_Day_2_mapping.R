# 11 April 2019 
# Mapping with ggplot
# Mapping for site locations 
# Along the South African coastline

# Load libraries 
library(tidyverse)
library(ggpubr)             # used for faceting - fn: ggarrange

# Load datasets 
load("data/south_africa_coast.RData")
load("data/sa_provinces.RData")
load("data/rast_annual.RData")
# load("data/MUR.RData")
load("data/MUR_low_res.RData")


# self-made colour pallette 
cols11 <- c("#004dcd", "#0068db", "#007ddb", "#008dcf", "#009bbc",
            "#00a7a9", "#1bb298", "#6cba8f", "#9ac290", "#bec99a")

# Plot South African coast
ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_point()

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group))                         # The province borders


# This is plotting MUR_low_res with sst (sst -> new name)

sst <- MUR_low_res
plot1 <- ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_raster(data = sst, aes(fill = bins)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) +
  scale_fill_manual("Temp. (°C)", values = cols11) +                         # Set the colour palette
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0)

# Save th eplot using ggsave

ggsave(plot = plot1, "plot1.pdf", height = 6, width = 9)



