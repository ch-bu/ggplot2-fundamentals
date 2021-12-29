library(tidyverse)
library(extrafont)


# Extrafont steps ---------------------------------------------------------
fonts()
font_import()
loadfonts()


world_bank_countries <- read_csv("data/world_bank_countries.csv")

# https://ggplot2tor.com/theme

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
    text = element_text(family = "Source Sans Pro"),
    plot.title = element_text(size = 20,
                              color= "#1e293b",
                              face = "bold",
                              hjust = .5),
    plot.subtitle = element_text(size = 15,
                                 color = "#334155",
                                 margin = margin(b = 20),
                                 hjust = .5),
    plot.caption = element_text(size = 10),
    axis.text = element_text(size = 14),
    axis.title = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(margin = margin(b = 5,
                                               t = 5))
    
  ) +
  labs(
    title = "The percentage of overweight people on the five continents",
    subtitle = "In Europe and Africa the rate of obesity has decreased",
    caption = "Source: Worldbank - World Development Indicator"
  )
