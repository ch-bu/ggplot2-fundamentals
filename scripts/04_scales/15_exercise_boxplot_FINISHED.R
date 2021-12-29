library(tidyverse)
library(scales)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year %in% c(2000, 2016)) %>% 
  mutate(
    year = year %>% as_factor,
    continent = continent %>% as_factor %>% 
      fct_relevel("Oceania", "Europe", "Asia", "Americas", "Africa")) %>%
  ggplot(aes(x = continent,
             y = overweight,
             fill = year)) +
  geom_boxplot(width = 0.75, 
               alpha = .8,
               position = position_dodge2(padding = 0.1)) +
  scale_y_continuous(name = "Overweight in percent",
                     labels = label_percent(scale = 1)) +
  scale_fill_manual(values = c("#5ab4ac", "#d8b365")) +
  scale_x_discrete(name = "Continent")