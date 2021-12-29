library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")
world_bank_areas <- read_csv("data/world_bank_areas.csv")
world_bank_income <- read_csv("data/world_bank_income.csv")

# Core idea of data visualization:
# In data visualizations, we map the aesthetics of 
# geometric objects to data. 
# We call this relationship an aesthetic mapping.

# Scatterplot
world_bank_countries %>% 
  filter(country == "United States") %>% 
  ggplot(aes(x = year, y = life_expectancy_at_birth,
             size = year)) +   
  geom_point() +
  labs(
    y = "life expectancy",
    title = "Life expectancy in the US from 1960 to 2020",
    caption = "data: Worldbank World Development Indicators"
  )


# Histogram
world_bank_countries %>% 
  filter(year == 2000) %>% 
  ggplot(aes(x = life_expectancy_at_birth)) +
  geom_histogram(fill = "steelblue",
                 color = "black",
                 alpha = .6,
                 size = 1.1)
