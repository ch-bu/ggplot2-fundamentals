library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Summary statistics geom_bar ---------------------------------------------
world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = continent)) + 
  geom_bar()

world_bank_countries %>% 
  filter(year == 2016) %>% 
  count(continent, name = "count") %>% 
  ggplot(aes(x = continent, y = count)) +
  geom_col()


# Summary statistics with geom_histogram ----------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = forest_land)) +
  geom_histogram(binwidth = 5, fill = "white", color = "black")