library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

world_bank_areas %>% 
  ggplot(aes(x = year,
             y = internet_usage,
             fill = area)) +
  geom_area(alpha = .9) +
  scale_x_continuous(limits = c(1990, 2017),
                     expand = expansion(0)) +
  scale_y_continuous(position = "right",
                     expand = expansion(0),
                     name = NULL,
                     labels = label_number(suffix = " billion",
                                           scale = 0.01,
                                           accuracy = 1.0)) +
  scale_fill_viridis_d()