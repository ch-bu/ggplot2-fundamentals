library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# color -> discrete variable ----------------------------------------------
world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth,
             color = continent)) +
  geom_point() 


# fill -> discrete variable ----------------------------------------------
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
               position = position_dodge2(padding = 0.1))


# color -> continuous variable --------------------------------------------
world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth,
             color = birth_rate)) +
  geom_point()

# fill -> continuous variable --------------------------------------------
ggplot(faithfuld, aes(waiting, eruptions, 
                      fill = density)) +
  geom_tile()