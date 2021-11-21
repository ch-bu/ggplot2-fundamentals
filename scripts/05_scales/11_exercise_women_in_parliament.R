library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2016) %>%
  ggplot(data = .,
         mapping = aes(x = women_in_national_parliaments)) + 
  geom_histogram(fill = "steelblue", color = "black",
                 bins = 30) 