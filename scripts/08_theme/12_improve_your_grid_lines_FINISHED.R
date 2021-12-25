library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# https://ggplot2tor.com/theme


# Blank plot --------------------------------------------------------------
world_bank_countries %>% 
  filter(year %in% c(2000, 2016)) %>% 
  mutate(
    year = year %>% as_factor,
    continent = continent %>% as_factor %>% 
      fct_relevel("Oceania", "Europe", "Asia", "Americas", "Africa")) %>%
  ggplot(aes(x = continent, 
             y = overweight,
             fill = year)) +
  scale_y_continuous(breaks = seq(0, 30, 5)) +
  theme(
    panel.background = element_blank(),
    panel.grid = element_line(color = "#EC4899"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_blank()
  )



# Obesity example ---------------------------------------------------------
world_bank_countries %>% 
  filter(year %in% c(2000, 2016)) %>% 
  mutate(
    year = year %>% as_factor,
    continent = continent %>% as_factor %>% 
      fct_relevel("Oceania", "Europe", "Asia", 
                  "Americas", "Africa")) %>%
  ggplot(aes(x = continent, 
             y = overweight,
             fill = year)) + 
  geom_boxplot(width = 0.75, 
               alpha = .8,
               position = position_dodge2(padding = 0.1)) +
  scale_fill_manual(values = c("#5ab4ac", "#d8b365")) +
  scale_y_continuous(name = "overweight Prevalence",
                     breaks = seq(0, 25, 5)) +
  scale_x_discrete(name = "Continent") +
  theme(
    # Code goes here
    plot.margin = unit(rep(1, 4), "cm"),
    # panel.background = element_blank(),
    # panel.grid = element_line(color = "#EC4899"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_blank()
  ) +
  labs(
    title = "The percentage of overweight people on the five continents",
    subtitle = str_wrap(paste0("In Europe and Africa, the number of overweight people",
                               " decreased from 2000 to 2016, while the number of",
                               "overweight people increased in the other continents."), 60),
    caption = "Source: Worldbank - World Development Indicator"
  )
