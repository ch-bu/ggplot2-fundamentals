library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")
world_bank_areas <- read_csv("data/world_bank_areas.csv")


# Example 1 ---------------------------------------------------------------

internet_usage <- world_bank_areas %>% 
  drop_na(internet_usage) %>% 
  filter(area != "World", year < 2015)

# Without faceting
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage,
             fill = area)) + 
  geom_area(position = position_dodge(width = 0),
            alpha = .5)

# With faceting
internet_usage %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(~ area)

# Example 2 ---------------------------------------------------------------

# Without faceting
world_bank_countries %>% 
  filter(year == "2016") %>% 
  ggplot(aes(x = gdp_per_capita, birth_rate, color = continent)) +
  geom_point()

# With faceting
world_bank_countries %>% 
  filter(year == "2016") %>% 
  ggplot(aes(x = gdp_per_capita, birth_rate)) +
  geom_point() +
  facet_wrap(~ continent)

# Example 3 ---------------------------------------------------------------

dat <- world_bank_countries %>% 
  filter(year %in% c("1980", "2000", "2016")) %>% 
  mutate(year = as.factor(year))

# Without faceting
dat %>% 
  ggplot(aes(x = gdp_per_capita, birth_rate, color = year, shape = continent)) +
  geom_point()

# With faceting
dat %>% 
  ggplot(aes(x = gdp_per_capita, birth_rate)) +
  geom_point() +
  facet_grid(rows = vars(continent), cols = vars(year))

