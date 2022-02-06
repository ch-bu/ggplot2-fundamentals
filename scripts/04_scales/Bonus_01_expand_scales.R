library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Continous scale ---------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = life_expectancy_at_birth)) +
  geom_histogram(fill = "grey20", color = "white")


# Discrete scale ----------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = continent)) + 
  geom_bar()