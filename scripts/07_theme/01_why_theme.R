library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Without an explicit theme -----------------------------------------------
world_bank_countries %>% 
  filter(year %in% c(2000, 2015)) %>% 
  mutate(
    year = year %>% as_factor,
    continent = continent %>% as_factor %>% 
      fct_relevel("Oceania", "Europe", "Asia", "Americas", "Africa")) %>%
  ggplot(aes(x = continent, 
             y = overweight,
             fill = year)) + 
  geom_boxplot(width = 0.75, 
               alpha = .8,
               position = position_dodge2(padding = 0.1)) +
  scale_fill_manual(values = c("#5ab4ac", "#d8b365")) +
  scale_y_continuous(name = "overweight Prevalence") +
  scale_x_discrete(name = "Continent")


# With an explicit theme --------------------------------------------------
world_bank_countries %>% 
  filter(year %in% c(2000, 2015)) %>% 
  mutate(
    year = year %>% as_factor,
    continent = continent %>% as_factor %>% 
      fct_relevel("Oceania", "Europe", "Asia", "Americas", "Africa")) %>%
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
    axis.title = element_text(size = 15, face = "bold"),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10)),
    axis.text = element_text(size = 15, color = "black"),
    legend.text = element_text(size = 13),
    panel.background = element_blank(),
    axis.line = element_line(color = "black"),
    legend.key = element_blank(),
    plot.margin = unit(rep(1, 4), "cm"),
    legend.position = "bottom"
  )
