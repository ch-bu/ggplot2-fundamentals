library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Comparison of co2 emissions across continents
world_bank_countries %>%
  filter(year == 2017) %>% 
  ggplot(aes(x = continent, y = co2_emissions_tons_per_capita)) +
  stat_summary(
    geom = "bar",
    fun = "mean",
    alpha = .6
  ) +
  stat_summary(
    geom = "errorbar",
    fun.data = "mean_cl_normal",
    width = .2
  ) +
  stat_summary(
    geom = "point",
    fun = "mean"
  )


# CO2 emissions across time
world_bank_countries %>% 
  ggplot(aes(x = year, y = co2_emissions_tons_per_capita)) +
  stat_summary(
    geom = "ribbon",
    fun.min = "min",
    fun.max = "max",
    alpha = .1
  ) +
  stat_summary(
    geom = "ribbon",
    fun.data = "mean_sdl",
    fun.args = list(mult = 1),
    alpha = .4
  ) +
  stat_summary(
    geom = "line",
    fun = "mean"
  )

