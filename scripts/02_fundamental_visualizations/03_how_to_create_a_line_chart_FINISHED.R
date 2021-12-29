library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

world_bank_areas %>% 
  filter(area == "World") %>% 
  ggplot(aes(x = year, 
             y = forest_land)) +
  geom_line(alpha = .7,
            size = 1.3,
            color = "blue")