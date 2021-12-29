library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


world_bank_countries %>% 
  filter(country %in% c("United States", 
                        "Japan", "China", 
                        "India")) %>% 
  ggplot(aes(year, co2_emissions_tons_per_capita,
             color = country)) +
  geom_line()
