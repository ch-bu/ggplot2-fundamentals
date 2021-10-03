library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

life_expectancy <- world_bank_countries %>% 
  mutate(
    continent = as.factor(continent) %>% 
      fct_relevel("Americas", "Europe",
                  "Africa", "Asia", "Oceania")
  ) %>%
  group_by(continent, year) %>% 
  summarise(
    mean = mean(life_expectancy_at_birth, na.rm = TRUE),
    min = min(life_expectancy_at_birth, na.rm = TRUE),
    max = max(life_expectancy_at_birth, na.rm = TRUE)
  ) %>% 
  ungroup()


life_expectancy %>% 
  ggplot(aes(x = year,
             ymin = min,
             ymax = max,
             fill = continent)) +
  geom_ribbon(alpha = .2)