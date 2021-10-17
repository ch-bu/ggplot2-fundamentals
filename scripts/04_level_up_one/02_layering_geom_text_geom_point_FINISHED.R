library(tidyverse)

world_bank_income <- read_csv("data/world_bank_income.csv")
world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_income %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             label = income_group)) +
  geom_point() +
  geom_text(hjust = 0, nudge_x = 300,
            nudge_y = 1)


world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             label = country)) +
  geom_point() +
  geom_text(hjust = 0, nudge_x = 300,
            nudge_y = 1)
