library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

women_parliaments_per_continent <- world_bank_countries %>% 
  filter(year == 2016) %>% 
  group_by(continent) %>% 
  summarise(
    lower = min(women_in_national_parliaments, na.rm = TRUE),
    median = median(women_in_national_parliaments, na.rm = TRUE),
    upper = max(women_in_national_parliaments, na.rm = TRUE)
  ) 

women_parliaments_per_continent %>% 
  ggplot(aes(x = continent,
             y = median,
             ymin = lower,
             ymax = upper)) +
  geom_col(alpha = .7) +
  geom_errorbar(width = .2) +
  geom_point()