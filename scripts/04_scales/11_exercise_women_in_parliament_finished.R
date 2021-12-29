library(tidyverse)
library(scales)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2016) %>%
  ggplot(data = .,
         mapping = aes(x = women_in_national_parliaments)) + 
  geom_histogram(fill = "steelblue", color = "black",
                 bins = 30) +
  scale_x_continuous(labels = label_percent(scale = 1),
                     # n.breaks = 10,
                     breaks = seq(0, 60, 10)) +
  scale_y_continuous(expand = expansion(0),
                     breaks = seq(0, 15, 5))