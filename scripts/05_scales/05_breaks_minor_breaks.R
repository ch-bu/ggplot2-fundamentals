library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth)) +
  geom_point() +
  theme(
    # panel.grid.major = element_line(color = "#EC4899"),
    # panel.grid.minor = element_line(color = "green"),
  )
