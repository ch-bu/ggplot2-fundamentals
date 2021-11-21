library(tidyverse)
library(scales)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

# https://scales.r-lib.org/index.html

# label_comma, label_dollar, label_number_si ------------------------------
world_bank_countries %>% 
  filter(year == 2000) %>%
  ggplot(aes(gdp_per_capita, y = life_expectancy_at_birth)) +
  geom_point()


# label_percent -----------------------------------------------------------
world_bank_countries %>% 
  filter(year == 2016) %>%
  mutate(women_in_national_parliaments = women_in_national_parliaments / 100) %>% 
  ggplot(aes(x = women_in_national_parliaments)) + 
  geom_histogram(fill = "steelblue", color = "black",
                 bins = 30)


# breaks_width ------------------------------------------------------------


# breaks_extended ---------------------------------------------------------


