library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

renewable_energy <- world_bank_countries %>% 
  filter(country %in% c("China", "India", "United States", 
                        "Germany")) %>% 
  select(country, year, renewable_energie_consumption) %>% 
  drop_na(renewable_energie_consumption)

labels <- renewable_energy %>% 
  filter(year == 2015)

renewable_energy %>% 
  ggplot(aes(x = year, y = renewable_energie_consumption)) +
  geom_line(aes(color = country)) +
  geom_point(aes(fill = country), color = "white", shape = 21,
             size = 2) +
  geom_text(aes(label = country), data = labels, 
            hjust = 0, nudge_x = 0.5) +
  scale_x_continuous(limits = c(1990, 2020)) +
  scale_color_manual(values = c("steelblue", rep("grey", 3)),
                     guide = "none") +
  scale_fill_manual(guide = "none",
                    values = c("steelblue", rep("grey", 3)))
