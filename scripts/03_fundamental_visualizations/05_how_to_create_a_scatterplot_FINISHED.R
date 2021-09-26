library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             color = continent)) +
  geom_point()