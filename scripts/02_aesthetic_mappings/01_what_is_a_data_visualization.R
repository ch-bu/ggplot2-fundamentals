library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")
world_bank_areas <- read_csv("data/world_bank_areas.csv")
world_bank_income <- read_csv("data/world_bank_income.csv")


# Life expectancy in Germany ----------------------------------------------
world_bank_countries %>% 
  filter(country == "Germany") %>% 
  ggplot(aes(year, life_expectancy_at_birth)) +  
  geom_point() +
  labs(
    y = "life expectancy",
    title = "Life expectancy in the Germany from 1960 to 2020",
    caption = "data: Worldbank World Development Indicators"
  )


# Life expectancy in the US -----------------------------------------------
world_bank_countries %>% 
  filter(country == "United States") %>% 
  ggplot(aes(year, life_expectancy_at_birth)) +  
  geom_point() +
  labs(
    y = "life expectancy",
    title = "Life expectancy in the US from 1960 to 2020",
    caption = "data: Worldbank World Development Indicators"
  )

# Highlight 1980
world_bank_countries %>% 
  filter(country == "United States") %>% 
  ggplot(aes(year, life_expectancy_at_birth)) +   
  annotate('rect', xmin = 1979.4, xmax = 1980.9, ymin = 73.3, ymax = 73.8,
           fill = "steelblue", alpha = .2) +
  geom_point() +
  labs(
    y = "life expectancy",
    title = "Life expectancy in the US from 1870 to 2020",
    caption = "data: Worldbank World Development Indicators"
  )

# Show dot only
world_bank_countries %>% 
  filter(country == "United States", year == 1980) %>% 
  ggplot(aes(year, life_expectancy_at_birth)) +   
  geom_point() +
  labs(
    y = "life expectancy",
    title = "Life expectancy in the US from 1870 to 2020",
    caption = "data: Worldbank World Development Indicators"
  ) +
  scale_x_continuous(limits = c(1960, 2019),
                     expand = expansion(mult = c(0, 0))) +
  scale_y_continuous(limits = c(69, 81),
                     expand = expansion(mult = c(0, 0)))



# Empty plot --------------------------------------------------------------
world_bank_countries %>% 
  filter(country == "United States", year == 1980) %>% 
  ggplot(aes(year, life_expectancy_at_birth)) +   
  geom_point() +
  labs(
    y = "life expectancy",
    title = "",
    caption = ""
  ) +
  scale_x_continuous(limits = c(1960, 2019),
                     expand = expansion(mult = c(0, 0))) +
  scale_y_continuous(limits = c(69, 81),
                     expand = expansion(mult = c(0, 0))) +
  theme(
    axis.line = element_line(color = '#ffffff'),
    axis.text = element_text(color = 'white'),
    axis.ticks = element_line(color = "white"),
    axis.title = element_text(color = "white"),
    panel.grid = element_blank()
  )



# Mapping of year and life expectancy -------------------------------------
world_bank_countries %>% 
  filter(country == "United States", year == 1980) %>% 
  ggplot(aes(year, life_expectancy_at_birth)) +   
  geom_point() +
  labs(
    y = "life expectancy",
    title = "Life expectancy in the US from 1870 to 2020",
    caption = "data: World Bank Open Data"
  ) +
  scale_x_continuous(limits = c(1960, 2019),
                     expand = expansion(mult = c(0, 0))) +
  scale_y_continuous(limits = c(69, 81),
                     expand = expansion(mult = c(0, 0))) +
  annotate("segment", x = 1960,xend = 1980, 
           y = 73.6, yend = 73.6,
           linetype = "dashed") +
  annotate("segment", x = 1980, xend = 1980, 
           y = 69, yend = 73.6,
           linetype = "dashed") 



# Impossible mapping ------------------------------------------------------
world_bank_countries %>% 
  filter(country == "United States", year == 1980) %>% 
  ggplot(aes(year, life_expectancy_at_birth)) +   
  geom_point() +
  labs(
    y = "life expectancy",
    title = "Life expectancy in the US from 1870 to 2020",
    caption = "data: World Bank Open Data"
  ) +
  scale_x_continuous(limits = c(1960, 2019),
                     expand = expansion(mult = c(0, 0))) +
  scale_y_continuous(limits = c(69, 81),
                     expand = expansion(mult = c(0, 0))) +
  annotate("segment", x = 1960,xend = 1980, 
           y = 73.6, yend = 73.6,
           linetype = "dashed") +
  annotate("segment", x = 1980, xend = 1980, 
           y = 69, yend = 73.6,
           linetype = "dashed") +
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )
