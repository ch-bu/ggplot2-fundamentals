library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

co2_per_year_and_continent <- world_bank_countries %>% 
  filter(year %in% c(1990, 2012)) %>% 
  group_by(continent, year) %>% 
  summarise(co2_emissions = mean(co2_emissions_tons_per_capita, 
                                 na.rm = TRUE)) %>% 
  mutate(year = year %>% as_factor) 

co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year))


# The problem -------------------------------------------------------------
co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year), position = "stack")

# The simple solution -----------------------------------------------------
co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year), position = "dodge")

# Adjacent bars with position_dodge() -------------------------------------
co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year), width = .9,
           position = position_dodge(width = .9))

co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year), width = .7,
           position = position_dodge(width = .7))

# Space between bars with position_dodge() --------------------------------
co2_per_year_and_continent %>% 
  ggplot(aes(continent, co2_emissions)) +
  geom_col(aes(fill = year), width = .7,
           position = position_dodge(width = .8))