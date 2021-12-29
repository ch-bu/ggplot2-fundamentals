library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == "2016") %>% 
  ggplot(aes(x = gdp_per_capita, y = birth_rate)) +
  geom_point() +
  facet_wrap(~ continent)

# Adding all the data to the panels
world_bank_countries %>% 
  filter(year == "2016") %>% 
  ggplot(aes(x = gdp_per_capita, y = birth_rate)) +
  geom_point() +
  facet_wrap(~ continent)

# Get more creative with facet_grid
world_bank_countries %>% 
  filter(year %in% c(1980, 2000, 2016)) %>% 
  ggplot(aes(x = gdp_per_capita, birth_rate)) +
  geom_point() +
  facet_grid(rows = vars(continent), cols = vars(year))