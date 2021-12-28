library(tidyverse)
library(scales)
library(ggtext) # install.packages("ggtext")

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

labels <- renewable_energy %>% 
  filter(year == min(year))

fake_grid <- tibble(
  x = c(rep(1990, 7)),
  xend = c(rep(2015, 7)),
  y = seq(10, 70, 10),
  yend = y
)

renewable_energy %>% 
  ggplot(aes(x = year,
             y = renewable_energie_consumption,
             color = country)) +
  geom_segment(
    data = fake_grid,
    aes(x = x, y = y, xend = xend, yend = yend),
    linetype = "dotted",
    color = "grey50"
  ) +
  geom_line(
    data = world_bank_countries %>% filter(continent == "Europe"),
    aes(group = country), color = "#E5E7EB"
  ) +
  geom_line(size = 1.1) +
  annotate(
    geom = "label",
    x = 2015,
    y = 70,
    size = 5,
    label = "Renewable energy\nconsumption",
    hjust = 1,
    label.size = 0
  ) +
  geom_text(
    data = labels,
    aes(label = country),
    size = 6,
    hjust = 1,
    nudge_x = -.3
  ) +
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
    title = paste("Scandinavian countries consume the most renewable energies in",
                  "Europe.<br />",
                  "In particular **<span style='color: #16A34A'>Norway</span>**",
                  "has been the most progressive since 1990.<br />",
                  "**The other",
                  "Scandinavian countries**, however, have caught up."),
    subtitle = "*All European countries are shown in light gray",
    y = "",
    caption = "Source: Worldbank - World Development Indicator",
    x = ""
  ) +
  theme(
    plot.margin = unit(rep(1.4, 4), "cm"),
    panel.background = element_rect(fill = NA, color = NA),
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_text(size = 15, color = "black"),
    plot.title = element_markdown(size = 19, lineheight = 1.1,
                              color = "black",
                              margin = margin(b = 15)),
    plot.subtitle = element_text(size = 14, color = "grey40",
                                 margin = margin(b = 15)),
    plot.caption = element_text(size = 13, color = "grey20",
                                margin = margin(t = 20)),
    axis.line = element_blank(),
  ) 

ggsave(
  filename = "final_plots/renewable_energies.png",
  dpi = 320,
  width = 12,
  height = 8
)