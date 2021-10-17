library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# Aesthetic mappings can be applied to the ggplot function 
# and any geometric object
#
# ggplot(data = <DATA>,
#        mapping = aes(<MAPPING>)) +
# geom_<NAME_OF_GEOMETRIC_OBJECT_>(aes(<MAPPING>)) +
# geom_<NAME_OF_GEOMETRIC_OBJECT_>(aes(<MAPPING>))


# Mappings in the ggplot function are applied 
# to all geometric objects
world_bank_countries %>%
  filter(year == 2016) %>%
  ggplot(aes(x = continent,
             y = overweight,
             color = continent)) +
  geom_boxplot() +
  geom_jitter(width = .2)

world_bank_income %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             color = income_group,
             label = income_group)) +
  geom_point(size = 5)+
  geom_text(hjust = 0, nudge_x = 550)

# Mappings in a geometric object are only 
# applied to this geometric object
world_bank_countries %>%
  filter(year == 2016) %>%
  ggplot(aes(x = continent,
             y = overweight)) +
  geom_boxplot() +
  geom_jitter(width = .2, aes(color = continent))

world_bank_income %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = birth_rate,
             label = income_group)) +
  geom_point(size = 5, aes(color = income_group)) +
  geom_text(hjust = 0, nudge_x = 550)