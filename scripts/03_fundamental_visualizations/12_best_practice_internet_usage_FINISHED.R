library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")


world_bank_areas %>% 
  ggplot(aes(x = year,
             y = internet_usage,
             fill = area)) +
  geom_area(alpha = .9)