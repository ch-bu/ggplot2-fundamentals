library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  filter(year == 2016) %>% 
  ggplot(aes(x = gdp_per_capita,
             y = overweight,
             color = continent,
             size = population_total)) + 
  geom_point() +
  scale_x_log10() +
  theme(
    legend.box.background = element_rect(fill = "grey",
                                         color = "black",
                                         size = 4),
    legend.box = "horizontal",
    legend.box.margin = margin(l = 30, t = 30,
                               b = 30, r = 30),
    legend.background = element_rect(fill = "grey80",
                                     color = "grey90",
                                     size = 2),
    legend.position = "bottom",
    legend.margin = margin(t = 20, l = 20, b = 20, r = 20),
    legend.direction = "vertical",
    legend.key = element_rect(fill = NA),
    legend.key.size = unit(.7, "cm"),
    legend.text = element_text(color = "#EC4899",
                               size = 12,
                               face = "bold"),
    legend.title = element_text(color = "steelblue",
                                size = 15,
                                hjust = .5,
                                margin = margin(b = 10))
  ) +
  guides(
    color = guide_legend(ncol = 2),
    size = guide_legend(ncol = 2)
  )


# Legend components you can change
#   - the box - yes
#   - the background - yes
#   - the position - yes
#   - legend margin - yes
#   - the direction - yes
#   - number of columns - yes
#   - the key - yes
#   - the key_glyph - yes
#   - the text - yes
#   - the title - yes