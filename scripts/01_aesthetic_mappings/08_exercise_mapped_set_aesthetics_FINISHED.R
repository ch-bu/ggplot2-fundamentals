library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Exercise: Recreate dataframe
# country       | life_expectancy_at_birth
# --------------------------------------
# Afghanistan   | 57
# United States | 78

# Exercise: Find mapped aesthetics + variable types
aes(
  x = country, # discrete
  y = life_expectancy_at_birth, # continous
  fill = country # discrete
)

# Exercise: Find set aesthetics
# alpha