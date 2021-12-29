library(tidyverse)
library(scales)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

forests <- world_bank_areas %>% 
  filter(year %in% c(1990, 2000, 2010, 2017)) %>% 
  filter(area != "World") %>% 
  mutate(year = as.factor(year))


forests %>% 
  mutate(
    area = str_wrap(area, 15)
  ) %>% 
  ggplot(aes(x = reorder(area, -forest_land),
             y = forest_land,
             fill = year)) +
  geom_col(width = .6, 
           alpha = .9,
           position = position_dodge(width = .6)) +
  scale_y_continuous(breaks = seq(0, 60, 10),
                     limits = c(0, 60),
                     labels = label_percent(scale = 1),
                     name = NULL,
                     expand = expansion(0)) +
  scale_x_discrete(name = NULL) +
  scale_fill_manual(values = c("#93C5FD", "#3B82F6", "#1D4ED8", "#1E3A8A")) +
  labs(
    title = str_wrap("The development of forest land around the world form 1990 to 2017", 88),
    subtitle = str_wrap("Although many people believe that forests are declining around the world, they have been growing in some areas of the world for two decades.", 75),
    y = "",
    x = "",
    fill = "",
    caption = "Source: Worldbank - World Development Indicator"
  ) +
  theme(
    plot.margin = unit(rep(2, 4), "cm"),
    legend.position = "bottom",
    plot.title = element_text(size = 15, face = "bold",
                              margin = margin(b = 10)),
    plot.title.position = "plot",
    plot.subtitle = element_text(size = 15,
                                 lineheight = 1.1,
                                 margin = margin(b = 30)),
    plot.caption = element_text(size = 13, color = "grey20",
                                margin = margin(t = 30),
                                hjust = 0),
    axis.text = element_text(size = 14, color = "black"),
    axis.ticks = element_blank(),
    axis.line.x = element_line(color = "grey50"),
    legend.text = element_text(size = 14, margin = margin(r = 12)),
    legend.margin = margin(t = 15),
    panel.background = element_rect(fill = NA, color = NA),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "grey90")
  )

