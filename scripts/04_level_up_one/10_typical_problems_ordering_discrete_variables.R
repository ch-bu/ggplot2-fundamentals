library(tidyverse)

world_bank_income <- read_csv("data/world_bank_income.csv")

world_bank_income %>% 
  filter(year == 2014) %>% 
  ggplot(aes(x = income_group,
             y = co2_emissions_tons_per_capita)) +
  geom_col()


# Reorder with factors ----------------------------------------------------


# Reorder with the reorder function ---------------------------------------


# Reorder with the fct_reorder function -----------------------------------


