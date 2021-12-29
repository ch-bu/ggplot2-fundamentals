library(tidyverse)
library(scales)

world_bank_income <- read_csv("data/world_bank_income.csv")

world_bank_income %>% 
  ggplot(aes(x = year, 
             y = population_total, 
             color = income_group)) + 
  geom_line(size = 1) +
  scale_color_viridis_d(begin = .1) +
  scale_y_continuous(labels = label_number_si(),
                     name = "total population") +
  scale_x_continuous(name = NULL)
  

