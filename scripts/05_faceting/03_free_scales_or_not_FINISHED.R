library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

internet_usage <- world_bank_areas %>% 
  drop_na(internet_usage) %>% 
  filter(area != "World", year < 2015)

internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(vars(area), scales = "free_y")


# Extreme example of free scale -------------------------------------------
(long_wb_data <- world_bank_income %>% 
   filter(year == 2016) %>% 
   select(income_group, birth_rate, population_total, gdp_per_capita) %>% 
   pivot_longer(cols = birth_rate:gdp_per_capita,
                values_to = "dat",
                names_to = "strange_variable"))

ggplot(long_wb_data, aes(x = income_group, y = dat)) +
  geom_col() +
  facet_wrap(~ strange_variable, scales = "free_y")
