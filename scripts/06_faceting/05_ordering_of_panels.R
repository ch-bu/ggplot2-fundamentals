library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

internet_usage <- world_bank_areas %>% 
  drop_na(internet_usage) %>% 
  filter(area != "World", year < 2015)

internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .7) +
  facet_wrap(vars(area), ncol = 4) +
  scale_x_continuous(breaks = seq(1990, 2020, by = 10))