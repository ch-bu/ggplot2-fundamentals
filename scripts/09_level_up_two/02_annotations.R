library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


world_bank_countries %>%
  ggplot(aes(x = year, y = women_in_national_parliaments)) +
  stat_summary(geom = "line", fun = "mean")

