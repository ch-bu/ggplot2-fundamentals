library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  ggplot(aes(women_in_national_parliaments)) +
  geom_histogram(fill = "steelblue",
                 color = "black",
                 binwidth = 3,
                 alpha = .7,
                 size = 0.2)