library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Continous scale ---------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = life_expectancy_at_birth)) +
  geom_histogram(fill = "grey20", color = "white") +
  scale_x_continuous(breaks = seq(30, 120, 2),
                     limits = c(52, 87),
                     expand = expansion(mult = c(.5, 0), add = 2)) +
  scale_y_continuous(limits = c(0, 16),
                     breaks = seq(-8, 25, 1),
                     expand = expansion(mult = .5, add = 0))


# Discrete scale ----------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = continent)) + 
  geom_bar() +
  scale_x_discrete(expand = expansion(mult = .2, add = c(1, 0)))