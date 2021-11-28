library(tidyverse)
library(scales)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

forests <- world_bank_areas %>% 
  filter(year %in% c(1990, 2000, 2010, 2017)) %>% 
  filter(area != "World") %>% 
  mutate(year = as.factor(year))


forests %>% 
  ggplot(aes(x = reorder(area, -forest_land),
             y = forest_land,
             fill = year)) +
  geom_col(width = .6, 
           alpha = .9,
           position = position_dodge(width = .6)) +
  scale_y_continuous(breaks = seq(0, 60, 10),
                     limits = c(0, 60),
                     labels = label_percent(scale = 1),
                     name = NULL,
                     expand = expansion(0)) +
  scale_x_discrete(name = NULL) +
  scale_fill_manual(values = c("#93C5FD", "#3B82F6", "#1D4ED8", "#1E3A8A"))