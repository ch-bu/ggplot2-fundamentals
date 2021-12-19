library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# How have obesity rates changed in these countries?
world_bank_countries %>% 
  filter(country %in% c("United States", "Germany", "China", "Mexico")) %>% 
  ggplot(aes(x = year, y = overweight))


# Has the population density in Asia increased over time?
world_bank_countries %>% 
  filter(continent == "Asia") %>% 
  ggplot(aes(x = year, y = population_density))


# How many women are in parliaments?
world_bank_countries %>% 
  filter(year %in% seq(1995, 2015, 5)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = continent, y = women_in_national_parliaments)) 


