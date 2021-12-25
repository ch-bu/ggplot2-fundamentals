library(tidyverse)

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
    plot.margin      = unit(rep(1, 4), "cm"),
    panel.background = element_rect(fill = "white"),
    panel.grid       = element_line(color = "grey80"),
    panel.grid.minor = element_blank(),
    axis.line        = element_line(color = "grey50"),
    axis.text        = element_text(size = 14),
    axis.title       = element_text(size = 14, face = "bold"),
    legend.position  = "bottom",
    legend.text      = element_text(size = 12)
  )

# element_rect
# element_line
# element_text
# element_blank()