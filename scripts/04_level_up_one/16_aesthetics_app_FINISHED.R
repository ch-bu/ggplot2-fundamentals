library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# https://ggplot2tor.com/aesthetics

# Scatterplot with geom_rug
world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita, y = birth_rate)) +
  geom_point() +
  geom_rug()


# geom_raster
world_bank_countries %>% 
  group_by(continent, year) %>% 
  summarise(mean = mean(birth_rate, na.rm = TRUE)) %>% 
  filter(year > 1990) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = year, y = continent, fill = mean)) +
  geom_raster()


# geom_violin
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = continent,
             y = overweight)) +
  geom_violin(fill = "steelblue",
              color = NA,
              alpha = .7)