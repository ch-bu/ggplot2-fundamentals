library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# https://ggplot2tor.com/theme


world_bank_countries %>% 
  filter(continent == "Africa", year == 2015) %>% 
  ggplot(aes(x = internet_usage, 
             y = mobile_cellular_subscriptions,
             label = country)) +
  geom_text(size = 4) +
  theme(
    axis.text = element_text(size = 4 * 2.8)
  )

# 14/5 -> 2.8