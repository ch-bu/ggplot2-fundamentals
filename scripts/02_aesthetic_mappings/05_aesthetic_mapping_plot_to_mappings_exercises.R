library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# The aes function
# aes(<AESTHETIC>  = <VARIABLE>,
#     <AESTHETIc2> = <VARIABLE2>)

# Example:
world_bank_countries %>% 
  filter(country == "United States") %>% 
  ggplot(aes(x = year, y = life_expectancy_at_birth)) +   
  geom_point()
# Solution: aes(x = year, y = life_expectancy_at_birth)


# Exercises ----------------------------------------------------------

# Area chart: Write down your aes function here:


# Line chart: Write down your aes function here:


# Boxplot: Write down your aes function here:


# Barplot: Write down your aes function here: