library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

overweight_summarized <- world_bank_countries %>% 
  drop_na(overweight) %>% 
  group_by(continent, year) %>%  
  summarise(
    upper = max(overweight, na.rm = TRUE),
    median = median(overweight, na.rm = TRUE),
    lower = min(overweight, na.rm = TRUE)
  ) %>% 
  mutate(year = as.double(year)) %>% 
  filter(year == 2010)

overweight_summarized %>% 
  ggplot(aes(x = continent,
             y = median,
             ymin = lower,
             ymax = upper)) +
  geom_pointrange()