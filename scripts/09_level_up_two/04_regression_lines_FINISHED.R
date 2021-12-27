library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = life_expectancy_at_birth, 
             gdp_per_capita)) + 
  geom_point() +
  scale_y_continuous(breaks = seq(0, 150000, 50000),
                     limits = c( 0, 150000),
                     expand = c(.05, .05)) +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(50, 90),
                     breaks = seq(30, 90, 10)) +
  geom_smooth(method = "lm", se = FALSE,
              color = "red") + 
  facet_wrap(vars(continent)) + 
  theme(
    plot.margin = unit(rep(1, 4), "cm")
  )


world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = life_expectancy_at_birth, 
             gdp_per_capita)) + 
  geom_point() +
  scale_y_continuous(breaks = seq(0, 150000, 50000),
                     limits = c( 0, 150000),
                     expand = c(.05, .05)) +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(50, 90),
                     breaks = seq(30, 90, 10)) +
  geom_smooth(method = "lm", se = FALSE,
              aes(color = continent)) + 
  theme(
    plot.margin = unit(rep(1, 4), "cm")
  )