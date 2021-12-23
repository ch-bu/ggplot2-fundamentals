library(tidyverse)
library(scales)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
    mutate(
      continent = as.factor(continent) %>%
        fct_relevel("Americas", "Europe",
                    "Africa", "Asia", "Oceania")
    ) %>%
  ggplot(aes(x = year, y = life_expectancy_at_birth)) +
  stat_summary(
    geom = "ribbon",
    fun.min = "min",
    fun.max = "max",
    fill = "#FCA5A5",
    alpha = .2
  ) +
  geom_line(aes(group = country), color = "#B91C1C", alpha = .4) +
  scale_fill_discrete(guide = "none") +
  scale_x_continuous(name = NULL,
                     expand = expansion(0),
                     breaks = seq(1970, 2010, 20)) +
  scale_y_continuous(breaks = seq(20, 90, 10),
                     limits = c(10, 90),
                     labels = label_number(suffix = " yrs")) +
  facet_wrap(~ continent, ncol = 5)
