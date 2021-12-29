library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

my_bar_chart <- world_bank_countries %>% #
  filter(country %in% c("Spain", 
                        "China",
                        "Russian Federation",
                        "United States"),
         year %in% c(1970, 2016)) %>% 
  mutate(year = as.factor(year)) %>% 
  ggplot(aes(x = country,
             y = co2_emissions_tons_per_capita,
             fill = year)) +
  geom_col(width = .7, position = position_dodge(width = .7))

# scale_<AESTHETIC>

# Variable scales ---------------------------------------------------------
my_bar_chart + 
  scale_fill_discrete(name = "My years",
                      direction = -1)


# Shortcut scales ---------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             size = population_total)) +
  geom_point() +
  scale_size(name = "total population")


# Named scales ------------------------------------------------------------
my_bar_chart +
  scale_fill_brewer()


# Binned scales -----------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             color = internet_usage)) +
  geom_point() +
  scale_color_steps()


# Manual scales -----------------------------------------------------------
my_bar_chart +
  scale_fill_manual(values = c("#024B78", "#FFB55B"))

