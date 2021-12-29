library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

world_bank_areas %>% 
  filter(area != "World") %>% 
  ggplot(aes(x = year,
             y = women_in_national_parliaments,
             fill = area,
             color = area)) +
  geom_area(alpha = .4)