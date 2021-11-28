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
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(~ area)

# Change number of columns
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(~ area, ncol = 4)

# Change number of rows
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(~ area, nrow = 4)

# Use the vars function
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(vars(area))

# Set the direction of the panels
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(vars(area), dir = "v")

# Free the scales
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(vars(area), scales = "free")