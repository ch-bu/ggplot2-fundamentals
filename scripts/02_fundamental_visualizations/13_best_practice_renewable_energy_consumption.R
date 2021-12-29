library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

renewable_energy <- world_bank_countries %>% 
  filter(country %in% c("Norway", "Finland", "Denmark", 
                        "Sweden")) %>% 
  select(country, year, renewable_energie_consumption) %>% 
  drop_na(renewable_energie_consumption)


