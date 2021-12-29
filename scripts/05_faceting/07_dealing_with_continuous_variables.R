library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# cut_width
world_bank_countries %>% 
  filter(country == "United States") %>% 
  ggplot(aes(x = gdp_per_capita, birth_rate)) +
  geom_point()

# cut_interval
world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = continent, y = birth_rate)) +
  geom_boxplot()