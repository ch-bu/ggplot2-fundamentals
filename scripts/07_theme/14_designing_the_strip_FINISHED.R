library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

world_bank_areas %>% 
  mutate(
    area = str_wrap(area, 12)
  ) %>% 
  ggplot(aes(x = year,
             y = internet_usage)) + 
  geom_area(alpha = .5) +
  facet_wrap(~ area, ncol = 4) +
  theme(
    # Code goes here
    # strip.background = element_rect(fill = "white",
    #                                 color = "grey20"),
    strip.background = element_blank(),
    strip.text = element_text(family = "Roboto",
                              size = 12),
    panel.spacing = unit(0.4, "cm")
  )
