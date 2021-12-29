library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# Set up your canvas for a line chart
world_bank_countries %>% 
  filter(country == "China") %>% 
  ggplot(aes(x = year, y = population_density))

# Set up your canvas for an area chart
world_bank_countries %>% 
  filter(country == "China") %>% 
  ggplot(aes(x = year, y = population_density))

# Set up your canvas for a boxplot
world_bank_countries %>% 
  filter(year == 2000) %>% 
  ggplot(aes(x = continent,
             y = internet_usage))