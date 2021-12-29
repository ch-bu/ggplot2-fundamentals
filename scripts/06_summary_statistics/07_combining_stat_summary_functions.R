library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Comparison of co2 emossions across continents
world_bank_countries %>%
  filter(year == 2017) %>% 
  ggplot(aes(x = continent, y = co2_emissions_tons_per_capita)) 


# CO2 emissions across time
world_bank_countries %>% 
  ggplot(aes(x = year, y = co2_emissions_tons_per_capita))


