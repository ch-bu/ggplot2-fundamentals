library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# The ggplot2 function
# ggplot(data = <DATA>, 
#        mapping = aes(<MAPPING>))


# You don't have to name the arguments
# ggplot(<DATA>, 
#        aes(<MAPPING>))


# Piping the data into the function
# data %>% 
#   ggplot(data = ., 
#          mapping = aes(<MAPPING>))


# Removing the data argument
# data %>% 
#   ggplot(mapping = aes(<MAPPING>))