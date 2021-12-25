library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# First plot --------------------------------------------------------------
world_bank_countries %>% 
  filter(year %in% c(2000, 2016)) %>% 
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
  scale_x_discrete(name = "Continent")  +
  labs(
    title = "The percentage of overweight people in the five continents",
    subtitle = str_wrap("In Europe and Africa, the number of overweight people decreased from 2000 to 2016, while the number of overweight people increased in the other continents.", 59),
    caption = "Source: Worldbank - World Development Indicator"
  ) +
  theme(
    plot.margin = unit(rep(1, 4), "cm"),
    plot.title = element_text(size = 15),
    plot.subtitle = element_text(margin = margin(b = 10), size = 13),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10)),
    axis.line = element_line(color = "black"),
    panel.background = element_blank(),
    panel.grid.major.y = element_line(color = "grey80"),
    panel.grid.minor.y = element_line(color = "grey80"),
    panel.grid.major.x = element_blank(),
    legend.position = "bottom",
    legend.key = element_rect(fill = NA),
    axis.text = element_text(size = 12, color = "black"),
    axis.title = element_text(face = "bold", size = 12)
  )



# Create your own theme ---------------------------------------------------
base_theme <- theme(
  plot.margin = unit(rep(1, 4), "cm"),
  plot.title = element_text(size = 15),
  plot.subtitle = element_text(margin = margin(b = 10), size = 13),
  axis.title.x = element_text(margin = margin(t = 10)),
  axis.title.y = element_text(margin = margin(r = 10)),
  axis.line = element_line(color = "black"),
  panel.background = element_blank(),
  panel.grid.major.y = element_line(color = "grey80"),
  panel.grid.minor.y = element_line(color = "grey80"),
  panel.grid.major.x = element_blank(),
  legend.position = "bottom",
  legend.key = element_rect(fill = NA),
  axis.text = element_text(size = 12, color = "black"),
  axis.title = element_text(face = "bold", size = 12)
)

set_base_theme <- function() {
  theme_set(theme_grey(base_size = 12) +
              base_theme)
}

set_default_theme <- function() {
  theme_set(theme_grey())
}

# Second plot -------------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth)) +
  geom_point(aes(fill = continent), color = "black", shape = 21,
             size = 3, alpha = .7) +
  scale_fill_viridis_d(name = "The five continents", option = "magma",
                       direction = -1) 



# Third plot --------------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = continent, y = gdp_per_capita)) + 
  geom_boxplot()
