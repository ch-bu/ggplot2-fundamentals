library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(continent == "Africa", year == 2015) %>% 
  ggplot(aes(x = internet_usage,
             y = mobile_cellular_subscriptions,
             label = country)) +
  geom_text(size = 3)