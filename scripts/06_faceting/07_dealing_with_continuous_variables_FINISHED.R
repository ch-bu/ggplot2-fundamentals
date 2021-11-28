library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# cut_width
world_bank_countries %>% 
  mutate(
    year_binned = cut_width(year, 20)
  ) %>% 
  ggplot(aes(x = gdp_per_capita, birth_rate)) +
  geom_point() +
  facet_wrap(~ year_binned)

# cut_interval
world_bank_countries %>% 
  mutate(
    year_binned = cut_interval(year, 4)
  ) %>% 
  ggplot(aes(x = continent, y = birth_rate)) +
  geom_boxplot() +
  facet_wrap(~ year_binned)