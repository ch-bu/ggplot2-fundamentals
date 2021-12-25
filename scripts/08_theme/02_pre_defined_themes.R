library(tidyverse)
library(hrbrthemes)  # install.packages("hbrthemes")
library(ggthemes)    # install.packages("ggthemes")
library(bbplot)      # install.packages('devtools') -> devtools::install_github('bbc/bbplot')
world_bank_countries <- read_csv("data/world_bank_countries.csv")

overweight_viz <- world_bank_countries %>% 
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
  scale_x_discrete(name = "Continent") 


# ggplot2 themes ----------------------------------------------------------
overweight_viz +
  # theme_minimal()
  # theme_bw()
  theme_light()


# Themes from other packages ----------------------------------------------
overweight_viz +
  # theme_ipsum_ps()
  # bbc_style()
  theme_gdocs()