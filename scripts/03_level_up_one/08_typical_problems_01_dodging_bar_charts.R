library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

co2_per_year_and_continent <- world_bank_countries %>% 
  filter(year %in% c(1990, 2012)) %>% 
  group_by(continent, year) %>% 
  summarise(mean = mean(co2_emissions_tons_per_capita, na.rm = TRUE)) %>% 
  mutate(year = year %>% as_factor) 

co2_per_year_and_continent %>% 
  ggplot(aes(continent, mean)) +
  geom_col(aes(fill = year))


# The problem -------------------------------------------------------------


# The simple solution -----------------------------------------------------


# Adjacent bars with position_dodge() -------------------------------------


# Space between bars with position_dodge() --------------------------------
