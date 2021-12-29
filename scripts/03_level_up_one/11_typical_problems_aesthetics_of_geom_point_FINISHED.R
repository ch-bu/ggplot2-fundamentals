library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth)) +
  geom_point(fill = "steelblue", shape = 21,
             size = 5)


# Shape 0 - 14 ------------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth)) +
  geom_point(color = "steelblue", shape = 8, size = 5,
             stroke = 1)

# Shape 15 - 20 -----------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth)) +
  geom_point(color = "steelblue", shape = 17,
             size = 5)

# Shape 21 - 25 -----------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth)) +
  geom_point(fill = "steelblue", shape = 24, size = 5,
             color = "grey20", stroke = 2)

