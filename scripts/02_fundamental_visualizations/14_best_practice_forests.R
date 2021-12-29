library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

forests <- world_bank_areas %>% 
  filter(year %in% c(1990, 2000, 2010, 2017)) %>% 
  filter(area != "World")