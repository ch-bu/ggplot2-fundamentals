library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

world_bank_areas %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(~ area, ncol = 4) +
  theme(
    # Code goes here
  )
