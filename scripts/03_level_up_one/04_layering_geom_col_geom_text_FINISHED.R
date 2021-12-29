library(tidyverse)

world_bank_income <- read_csv("data/world_bank_income.csv")
world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_income %>% 
  filter(year == 2014) %>% 
  ggplot(aes(x = income_group,
             y = co2_emissions_tons_per_capita,
             label = round(co2_emissions_tons_per_capita, 2))) +
  geom_col() +
  geom_text(position = position_stack(vjust = 0.5),
            color = "white")