library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


world_bank_countries %>% 
  filter(country %in% c("United States", "Germany"),
         year %in% c(1990, 2000, 2010, 2020)) %>% 
  ggplot(aes(x = year, 
             y = internet_usage, 
             color = country)) +
  geom_line() +
  # scale_x_continuous(limits = c(1990, 1999)) +
  scale_y_continuous(limits = c(0, 100)) +
  coord_cartesian(xlim = c(1990, 1999))



