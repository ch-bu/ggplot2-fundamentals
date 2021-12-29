library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Measures of center -------------------------------------------------------
world_bank_countries %>% 
  ggplot(aes(x = year, y = gdp_per_capita)) +
  stat_summary(
    geom = "line",
    fun = "mean"
  )


# Measures of center and/or spread explicitly -----------------------------
world_bank_countries %>% 
  ggplot(aes(x = year, y = gdp_per_capita)) +
  stat_summary(
    geom = "errorbar",
    fun = "mean",
    fun.min = "min", 
    fun.max = "max", 
    alpha = .4
  ) +
  stat_summary( 
    geom = "line",
    fun = "mean"
  ) +
  facet_wrap(~ continent) 


# Measures of center and/or spread with a function ------------------------
world_bank_countries %>% 
  ggplot(aes(x = year, y = gdp_per_capita)) +
  stat_summary(
    geom = "pointrange",
    fun.data = "mean_sdl", 
    fun.args = list(mult = 1)
  )

