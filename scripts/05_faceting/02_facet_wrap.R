library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

internet_usage <- world_bank_areas %>% 
  drop_na(internet_usage) %>% 
  filter(area != "World", year < 2015)

internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage,
             fill = area)) + 
  geom_area(alpha = .5)

# Use a discrete variable for faceting

# Change number of columns

# Change number of rows

# Use the vars function

# Set the direction of the panels

# Free the scales
