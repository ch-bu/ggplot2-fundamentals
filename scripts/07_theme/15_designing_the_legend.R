library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = overweight,
             color = continent,
             size = population_total)) + 
  geom_point() + 
  scale_x_log10()


# Legend components you can change
#   - the box
#   - the background
#   - the position
#   - the direction
#   - number of columns
#   - the key
#   - the key_glyph
#   - the text
#   - the title