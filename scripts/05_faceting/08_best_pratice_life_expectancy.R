library(tidyverse)
library(scales)

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
  geom_ribbon(alpha = .2) +
  scale_fill_discrete(guide = "none") +
  scale_x_continuous(name = NULL,
                     expand = expansion(0),
                     breaks = seq(1970, 2010, 20)) +
  scale_y_continuous(breaks = seq(20, 90, 10),
                     limits = c(10, 90),
                     labels = label_number(suffix = " yrs"))