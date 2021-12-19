library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Measures of center -------------------------------------------------------
world_bank_countries %>% 
  ggplot(aes(x = year, y = gdp_per_capita)) +
  stat_summary(
    geom = "line", # You always need a geometric object with stat_summary
    fun = "mean",
    color = "blue", # You can add any aesthetic of the geometric object as an argument
    alpha = .4
  )


# Measures of center and/or spread explicitly -----------------------------
world_bank_countries %>% 
  ggplot(aes(x = year, y = gdp_per_capita)) +
  stat_summary(
    geom = "errorbar",
    fun = "mean",
    fun.min = "min", # Lower bound of the geometric object
    fun.max = "max", # Upper bound of the geometric object
    alpha = .4
  ) +
  stat_summary( # I can layer stat_summaries on top of each other
    geom = "line",
    fun = "mean"
  ) +
  facet_wrap(~ continent) # stat_summary also works with faceting


# Measures of center and/or spread with a function ------------------------
world_bank_countries %>% 
  ggplot(aes(x = year, y = gdp_per_capita)) +
  stat_summary(
    geom = "pointrange",
    fun.data = "mean_sdl", # These are functions from the Hmisc package
    fun.args = list(mult = 1) # Use fun.args to set arguments in our fun.data function
  )

