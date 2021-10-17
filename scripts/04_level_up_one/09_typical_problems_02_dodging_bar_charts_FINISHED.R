library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

co2_per_year_and_continent <- world_bank_countries %>% 
  filter(year %in% c(1990, 2012)) %>% 
  group_by(continent, year) %>% 
  summarise(mean = mean(co2_emissions_tons_per_capita, na.rm = TRUE)) %>% 
  mutate(year = year %>% as_factor) 

co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year), width = .7,
           position = position_dodge(width = .8))


# Overlapping bars with position_dodge() -------------------------------------
co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(alpha = .7, aes(fill = year), width = .9,
           position = position_dodge(width = .5))


# Space between bars with position_dodge2() -------------------------------
co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year), width = .9,
           position = position_dodge2(padding = .1))

