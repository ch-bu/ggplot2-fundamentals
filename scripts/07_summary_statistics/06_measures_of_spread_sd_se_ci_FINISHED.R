library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# How have obesity rates changed across continents?
world_bank_countries %>% 
  ggplot(aes(x = year, y = overweight)) +
  stat_summary(
    geom = "pointrange",
    fun.data = mean_cl_boot,
    fun.args = list(B = 1000),
    size = .2
  ) +
  facet_wrap(~ continent)


# How many women are in parliaments?
world_bank_countries %>% 
  filter(year %in% seq(2000, 2015, 5)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = continent, y = women_in_national_parliaments)) +
  stat_summary(
    geom = "errorbar",
    fun.data = "mean_cl_normal",
    width = .6,
    mapping = aes(color = year),
    position = position_dodge2()
  )
