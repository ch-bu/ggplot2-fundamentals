library(tidyverse)
library(scales)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

renewable_energy <- world_bank_countries %>% 
  filter(country %in% c("Norway", "Finland", "Denmark", 
                        "Sweden")) %>% 
  select(country, year, renewable_energie_consumption) %>% 
  drop_na(renewable_energie_consumption) %>% 
  mutate(
    country = as_factor(country) %>% 
      fct_relevel("Norway", "Denmark", "Sweden", "Finland")
  )


renewable_energy %>% 
  ggplot(aes(x = year,
             y = renewable_energie_consumption,
             color = country)) +
  geom_line(size = 1.1) +
  scale_y_continuous(position = "right",
                     limits = c(0, 75),
                     name = NULL,
                     labels = label_percent(scale = 1),
                     breaks = seq(10, 70, 10)) +
  scale_x_continuous(limits = c(1986, 2015),
                     expand = expansion(0),
                     name = NULL) +
  scale_color_manual(values = c("#16A34A",
                                rep("1F2937", 3)),
                     guide = "none") +
  labs(
    title = str_wrap("Scandinavian countries consume the most renewable energies in Europe. In particular Norway has been the most progressive since 1990. The other. Scandinavian countries, however, have caught up.", 80),
    subtitle = "*All European countries are shown in light gray",
    y = "",
    caption = "Source: Worldbank - World Development Indicator",
    x = ""
  ) +
  theme(
    plot.margin = unit(rep(1.4, 4), "cm"),
    panel.background = element_rect(fill = NA, color = NA),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "grey70", linetype = "dotted"),
    axis.ticks = element_blank(),
    axis.text = element_text(size = 15, color = "black"),
    plot.title = element_text(size = 19, lineheight = 1.1,
                              color = "black",
                              margin = margin(b = 15)),
    plot.subtitle = element_text(size = 14, color = "grey40",
                                 margin = margin(b = 15)),
    plot.caption = element_text(size = 13, color = "grey20",
                                margin = margin(t = 20))
  ) 
