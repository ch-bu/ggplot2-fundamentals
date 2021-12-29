library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

world_bank_areas %>% 
  filter(area != "World") %>% 
  mutate(
    internet_users = internet_usage * population_total
  ) %>% 
  ggplot(aes(x = year,
             y = internet_users,
             fill = area)) +
  geom_area(alpha = .9) +
  scale_x_continuous(limits = c(1990, 2017),
                     expand = expansion(0)) +
  scale_y_continuous(position = "right",
                     expand = expansion(0),
                     name = NULL,
                     labels = label_number(suffix = " billion",
                                           scale = 1e-11,
                                           accuracy = 1.0)) +
  scale_fill_viridis_d() +
  labs(
    title = "The rise of the internet",
    subtitle = "Number of people using the internet from 1990 to 2017",
    caption = "Source: Worldbank - World Development Indicator",
    y = "",
    x = "",
    fill = ""
  ) +
  theme(
    plot.margin = unit(rep(2, 4), "cm"),
    plot.title = element_text(face = "bold", size = 23,
                              hjust = 0.5, margin = margin(b = 10)),
    plot.subtitle = element_text(size = 19, hjust = .5,
                                 margin = margin(b = 20)),
    plot.caption = element_text(color = "grey20", size = 13,
                                margin = margin(t = 20)),
    panel.background = element_rect(fill = NA, color = NA),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "grey80", linetype = "solid",
                                      size = .2),
    axis.text = element_text(size = 17, color = "black"),
    axis.ticks = element_line(color = "grey80"),
    legend.position = "top",
    legend.text = element_text(size = 13),
    legend.key.size = unit(0.7, "cm"),
    legend.key = element_rect(color = NA, fill = NA)

  )