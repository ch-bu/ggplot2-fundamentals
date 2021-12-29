library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# With y-aesthetic mapping
world_bank_countries %>% 
  filter(country %in% c("Spain", 
                        "China",
                        "Russian Federation",
                        "United States"),
         year %in% c(1970, 2016)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = country,
             y = co2_emissions_tons_per_capita,
             fill = year)) +
  geom_col(position = position_dodge2())

world_bank_countries %>% 
  filter(country %in% c("Spain", 
                        "China",
                        "Russian Federation",
                        "United States"),
         year %in% c(2016)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = country,
             y = co2_emissions_tons_per_capita)) +
  geom_col(fill = "steelblue",
           alpha = .8,
           color = "black",
           width = .9,
           size = 0.4)

# Without y-aesthetic mapping
world_bank_countries %>% 
  filter(year %in% c(1970, 2016)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = continent,
             fill = year)) +
  geom_bar(position = position_dodge2())