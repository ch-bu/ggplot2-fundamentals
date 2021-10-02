library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year %in% c(1990, 2015)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = continent,
             y = renewable_energie_consumption,
             color = year)) +
  geom_jitter(width = .2, alpha = .5,
              size = 1)