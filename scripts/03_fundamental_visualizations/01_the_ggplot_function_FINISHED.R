library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# The ggplot2 function
# ggplot(data = <DATA>, 
#        mapping = aes(<MAPPING>))
ggplot(data = world_bank_countries,
       mapping = aes(x = co2_emissions_tons_per_capita,
                     y = gdp_per_capita))

# You don't have to name the arguments
# ggplot(<DATA>, 
#        aes(<MAPPING>))
ggplot(world_bank_countries,
       aes(x = co2_emissions_tons_per_capita,
                     y = gdp_per_capita))

# Piping the data into the function
# data %>% 
#   ggplot(data = ., 
#          mapping = aes(<MAPPING>))
world_bank_countries %>%
  ggplot(data = .,
         mapping = aes(x = co2_emissions_tons_per_capita,
             y = gdp_per_capita))


# Removing the data argument
# data %>% 
#   ggplot(mapping = aes(<MAPPING>))
world_bank_countries %>%
  ggplot(aes(x = co2_emissions_tons_per_capita,
                       y = gdp_per_capita))