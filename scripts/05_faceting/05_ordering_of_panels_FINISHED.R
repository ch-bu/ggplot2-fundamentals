library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

internet_usage <- world_bank_areas %>% 
  drop_na(internet_usage) %>% 
  filter(area != "World", year < 2015) %>% 
  mutate(
    area = as.factor(area) %>% 
      fct_relevel("North America", "Latin America & Caribbean",
                  "Europe & Central Asia", "Sub-Saharan Africa",
                  "Middle East & North Africa", "South Asia")
  )

internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .7) +
  facet_wrap(vars(area), ncol = 7) +
  scale_x_continuous(breaks = seq(1990, 2020, by = 10))
