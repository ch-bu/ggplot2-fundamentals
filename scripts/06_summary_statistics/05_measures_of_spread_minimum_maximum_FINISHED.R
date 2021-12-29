library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# How have obesity rates changed across continents?
world_bank_countries %>% 
  ggplot(aes(x = year, y = overweight)) +
  stat_summary(
    geom = "ribbon",
    fun.min = "min",
    fun.max = "max",
    alpha = .6
  ) +
  facet_wrap(~ continent)


# How many women are in parliaments?
world_bank_countries %>% 
  filter(year %in% seq(1995, 2015, 5)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = continent, y = women_in_national_parliaments)) +
  stat_summary(
    geom = "crossbar",
    fun = "median",
    fun.min = "min",
    fun.max = "max",
    mapping = aes(fill = year),
    position = position_dodge2(.8),
    width = .7
  )
