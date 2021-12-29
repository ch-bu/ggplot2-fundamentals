library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

obesity_data <- world_bank_countries %>% 
  filter(year %in% c(2010, 2012, 2014, 2016)) %>% 
  group_by(continent, year) %>% 
  summarise(
    lower = min(overweight, na.rm = TRUE),
    median = median(overweight, na.rm = TRUE),
    upper = max(overweight, na.rm = TRUE)
  ) %>% 
  mutate(
    year = year %>% as_factor
  )
