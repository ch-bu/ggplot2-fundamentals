library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Example 1 - Mean --------------------------------------------------------
# Without stat_summary
world_bank_countries %>% 
  group_by(continent, year) %>% 
  summarise(
    mean_forest = mean(forest_land, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = year, y = mean_forest)) +
  geom_area(alpha = .7) +
  facet_wrap(~ continent)

# With stat_summary
world_bank_countries %>% 
  ggplot(aes(x = year, y = forest_land)) +
  stat_summary(fun = "mean", geom = "area", alpha = .7) +
  facet_wrap(~ continent)


# Example 2 - Standard deviation ------------------------------------------
# Without stat_summary
world_bank_countries %>% 
  group_by(continent, year) %>% 
  summarise(
    mean_forest = mean(forest_land, na.rm = TRUE),
    max = mean(forest_land, na.rm = TRUE) +
      sd(forest_land, na.rm = TRUE),
    min = mean(forest_land, na.rm = TRUE) -
      sd(forest_land, na.rm = TRUE)
  ) %>%
  ggplot(aes(x = year, y = mean_forest, ymin = min, ymax = max)) +
  geom_ribbon(alpha = .4) +
  geom_line() +
  scale_x_continuous(limits = c(1960, 2018)) +
  facet_wrap(~ continent)

# With stat_summary
world_bank_countries %>% 
  ggplot(aes(x = year, y = forest_land)) +
  stat_summary(fun.data = "mean_sdl", geom = "ribbon", alpha = .4,
               fun.args = list(mult = 1), na.rm = TRUE) +
  stat_summary(fun = "mean", geom = "line",
               fun.args = list(na.rm = TRUE)) +
  scale_x_continuous(limits = c(1960, 2018)) +
  facet_wrap(~ continent)

