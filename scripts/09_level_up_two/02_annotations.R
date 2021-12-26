library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

merkel <- tibble(
  women_in_national_parliaments = 17,
  year = 2005,
  name = str_wrap("Angela Merkel becomes chancellor of Germany", 10),
  continent = "Europe"
)

merkel_line <- tibble(
  women_in_national_parliaments = 19.9,
  yend = 21.5,
  year = 2005,
  xend = 2005,
  continent = "Europe",
)

# world_bank_countries %>% 
#   ggplot(aes(x = year, y = women_in_national_parliaments)) +
#   stat_summary(geom = "line", fun = "mean") +
#   geom_text(data = merkel, aes(label = name),
#             size = 3, vjust = 0)


world_bank_countries %>% 
  ggplot(aes(x = year, y = women_in_national_parliaments)) +
  stat_summary(geom = "line", fun = "mean") +
  annotate(
    geom = "text",
    x = 2005,
    y = 17,
    label = str_wrap("Angela Merkel becomes chancellor of Germany", 10),
    size = 3,
    vjust = 0
  ) +
  annotate(
    geom = "segment",
    x = 2005,
    y = 16.8,
    xend = 2005,
    yend = 15.5,
    linetype = "dotted"
  ) 


world_bank_countries %>% 
  ggplot(aes(x = year, y = women_in_national_parliaments)) +
  stat_summary(geom = "line", fun = "mean") +
  geom_text(data = merkel, aes(label = name), 
            size = 3, vjust = 0) +
  geom_segment(data = merkel_line, aes(xend = xend, yend = yend),
               linetype = "dotted") + 
  facet_wrap(vars(continent))
