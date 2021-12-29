library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Exercices ---------------------------------------------------------------

# Exercise 1:
aes(
  x = continent,
  y = life_expectancy_at_birth
)
# TODO: 


# Exercise 2:
aes(
  x = birth_rate,
  y = gdp_per_capita,
  color = continent
)
# TODO: 


# Exercise 3:
aes(
  x = year,
  y = internet_usage
)
# TODO: 