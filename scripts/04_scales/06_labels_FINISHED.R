library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(country %in% c("United States", "Germany")) %>% 
  ggplot(aes(x = year, 
             y = internet_usage, 
             color = country)) +
  geom_line() +
  scale_y_continuous(breaks = c(25, 50, 60, 75),
                     labels = c("twenty five",
                                "fifty", "sixty",
                                "seventy five")) +
  scale_x_continuous(labels = function(x) paste(x, ' year'))
