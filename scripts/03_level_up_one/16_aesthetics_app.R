library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# https://ggplot2tor.com/aesthetics


# geom_rug
world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita, y = birth_rate)) +
    geom_point() 

# geom_raster
world_bank_countries %>% 
  group_by(continent, year) %>% 
  summarise(mean = mean(birth_rate, na.rm = TRUE)) %>% 
  filter(year > 1990)

# geom_violin
world_bank_countries %>% 
  filter(year == 2017)