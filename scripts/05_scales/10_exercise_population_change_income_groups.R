library(tidyverse)

world_bank_income <- read_csv("data/world_bank_income.csv")

world_bank_income %>% 
  ggplot(aes(x = year, y = population_total, 
             color = income_group)) + 
  geom_line(size = 1)

