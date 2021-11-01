library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% #
  filter(country %in% c("Spain", 
                        "China",
                        "Russian Federation",
                        "United States"),
         year %in% c(1970, 2016)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = country,
             y = co2_emissions_tons_per_capita,
             fill = year)) +
  geom_col(width = .7, position = position_dodge(width = .7))