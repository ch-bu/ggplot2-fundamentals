library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# ggplot2 makes decisions for aesthetic mappings
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


# I don't use scales by setting aesthetics
world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = continent,
             y = co2_emissions_tons_per_capita)) +
  geom_boxplot(fill = "steelblue")


# An intro to scales
