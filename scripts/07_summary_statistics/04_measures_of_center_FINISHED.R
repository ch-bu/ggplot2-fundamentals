library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# How have obesity rates changed in these countries?
world_bank_countries %>% 
  filter(country %in% c("United States", "Germany", "China", "Mexico")) %>% 
  ggplot(aes(x = year, y = overweight)) +
  stat_summary(
    geom = "line",
    fun = "mean",
    fun.args = list(na.rm = TRUE),
    linetype = "dashed",
    color = "steelblue"
  ) +
  stat_summary(
    geom = "line",
    fun = "median",
    fun.args = list(na.rm = TRUE),
    linetype = "solid",
    color = "grey70"
  )


# Has the population density in Asia increased over time?
world_bank_countries %>% 
  filter(continent == "Asia") %>% 
  ggplot(aes(x = year, y = population_density)) +
  stat_summary(
    geom = "area",
    fun = "median",
    alpha = .4
  )


# How many women are in parliaments?
world_bank_countries %>% 
  filter(year %in% seq(1995, 2015, 5)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = continent, y = women_in_national_parliaments)) +
  stat_summary(
    geom = "bar",
    fun = "mean",
    position = position_dodge(),
    mapping = aes(fill = year)
  )


