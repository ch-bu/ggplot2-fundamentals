library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(country %in% c("United States", "Germany")) %>% 
  ggplot(aes(x = year, 
             y = internet_usage, 
             color = country)) +
  geom_line()