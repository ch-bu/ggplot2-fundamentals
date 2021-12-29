library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

renewable_energy <- world_bank_countries %>% 
  filter(country %in% c("China", "India", "United States", 
                        "Germany")) %>% 
  select(country, year, renewable_energie_consumption) %>% 
  drop_na(renewable_energie_consumption)


renewable_energy %>% 
  ggplot(aes(x = year,
             y = renewable_energie_consumption,
             color = country)) + 
  geom_line() +
  geom_point(shape = 21, color = "white",
             size = 2,
             aes(fill = country))