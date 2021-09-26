library(tidyverse)

# Don't use the same aesthetic twice

aes(
  x = continent,
  y = gdp_per_capita,
  color = country,
  color = continent
) # -> WRONG

aes(
  x = continent,
  y = gdp_per_capita,
  fill= continent
) # -> OK