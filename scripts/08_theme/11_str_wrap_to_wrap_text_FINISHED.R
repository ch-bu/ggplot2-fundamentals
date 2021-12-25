library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")
world_bank_areas <- read_csv("data/world_bank_areas.csv")

# https://ggplot2tor.com/theme


# Example 1 ---------------------------------------------------------------
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
  scale_y_continuous(name = "overweight Prevalence") +
  scale_x_discrete(name = "Continent") +
  theme(
    # Code goes here
    plot.margin = unit(rep(1, 4), "cm")
  ) +
  labs(
    title = "The percentage of overweight people on the five continents",
    subtitle = str_wrap(paste0("In Europe and Africa, the number of overweight people",
                      " decreased from 2000 to 2016, while the number of",
                      "overweight people increased in the other continents."), 60),
    caption = "Source: Worldbank - World Development Indicator"
  )



# Example 2 ---------------------------------------------------------------
world_bank_areas %>% 
  filter(year == 2017) %>% 
  mutate(
    area = str_wrap(area, 10)
  ) %>% 
  ggplot(aes(x = area, y = overweight)) +
  geom_col() +
  theme(
    axis.text = element_text(size = 12)
  )


world_bank_areas %>% 
  filter(year == 2017) %>% 
  # mutate(
  #   area = str_wrap(area, 10)
  # ) %>% 
  ggplot(aes(x = area, y = overweight)) +
  geom_col() +
  scale_x_discrete(guide = guide_axis(n.dodge = 2)) +
  theme(
    axis.text = element_text(size = 12)
    # axis.text = element_text(size = 12, angle = 90)
  )