library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# https://ggplot2tor.com/scales

# Using the app for a bar chart -------------------------------------------
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
  geom_col(width = .7, 
           position = position_dodge(width = .7)) +
  scale_fill_viridis_d(option = "plasma") +
  # scale_fill_grey(start = .4) +
  scale_x_discrete(position = "top",
                   labels = function(x) paste("#", x),
                   expand = expansion(mult = .5))


# Using the app for a scatterplot -----------------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             size = population_total)) +
  geom_point() +
  scale_x_continuous(breaks = seq(0, 190000, 50000)) +
  scale_y_continuous(breaks = seq(0, 40, 2),
                     limits = c(0, 80))
  

