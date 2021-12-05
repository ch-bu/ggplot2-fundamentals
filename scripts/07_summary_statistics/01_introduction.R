library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Example 1 - MeanExample 1 - Mean ----------------------------------------
world_bank_countries %>% 
  group_by(continent, year) %>% 
  summarise(
    mean_forest = mean(forest_land, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = year, y = mean_forest)) +
  geom_area(alpha = .7) +
  facet_wrap(~ continent)


world_bank_countries %>% 
  ggplot(aes(x = year, y = forest_land)) +
  stat_summary(fun = "mean", geom = "area", alpha = .7) +
  facet_wrap(~ continent)


# Example 1 - Standard deviation ------------------------------------------
world_bank_countries %>% 
  group_by(year) %>% 
  summarise(
    mean_life = mean(life_expectancy_at_birth, na.rm = TRUE),
    max = mean(life_expectancy_at_birth, na.rm = TRUE) + 
      sd(life_expectancy_at_birth, na.rm = TRUE),
    min = mean(life_expectancy_at_birth, na.rm = TRUE) - 
      sd(life_expectancy_at_birth, na.rm = TRUE)
  ) %>%
  ggplot(aes(x = year, y = mean_life, ymin = min, ymax = max)) +
  geom_ribbon(alpha = .4) +
  geom_line() +
  scale_x_continuous(limits = c(1960, 2018)) +
  scale_y_continuous(limits = c(40, 85))


world_bank_countries %>% 
  ggplot(aes(x = year, y = life_expectancy_at_birth)) +
  stat_summary(fun.data = "mean_sdl", geom = "ribbon", alpha = .4,
               fun.args = list(mult = 1), na.rm = TRUE) +
  stat_summary(fun = "mean", geom = "line") +
  scale_x_continuous(limits = c(1960, 2018)) +
  scale_y_continuous(limits = c(40, 85))

