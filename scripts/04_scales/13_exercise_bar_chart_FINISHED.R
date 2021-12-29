library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_income %>% 
  mutate(income_group = as_factor(income_group) %>% 
           fct_relevel("High income", "Upper middle income",
                       "Middle income", "Lower middle income",
                       "Low income"),
         year = as_factor(year)) %>% 
  filter(year %in% c(2000, 2005, 2010, 2015)) %>% 
  ggplot(aes(x = income_group,
             y = co2_emissions_tons_per_capita,
             fill = year)) +
  geom_col(alpha = .8, position = position_dodge(.8), 
           width = .75) +
  scale_y_continuous(breaks = seq(0, 12, 2)) +
  scale_fill_hue(h = c(40, 240), c = 60)
