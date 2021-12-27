library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


plot <- world_bank_countries %>% 
  filter(year == 2017) %>% 
  ggplot(aes(x = continent, y = co2_emissions_tons_per_capita)) +
  stat_summary(geom = "bar", fun = "mean", alpha = .8) +
  stat_summary(geom = "errorbar", fun.data = "mean_cl_normal", width = .2) +
  scale_y_continuous(limits = c(0, 7), expand = c(0, 0)) +
  labs(
    x = "",
    y = expression(paste(CO[2], " emissions per capita")) 
  ) +
  theme(
    plot.title = element_text(size = 20,
                              face = "bold",
                              margin = margin(b = 35)),
    plot.margin = unit(rep(1, 4), "cm"),
    axis.text = element_text(size = 16, color = "#22292F"),
    axis.title = element_text(size = 16),
    axis.text.y = element_text(margin = margin(r = 5)),
    axis.text.x = element_text(margin = margin(t = 5)),
    plot.caption = element_text(size = 12, 
                                face = "italic",
                                color = "#606F7B",
                                margin = margin(t = 15)),
    axis.line = element_line(color = "#3D4852"),
    axis.ticks = element_line(color = "#3D4852"),
    panel.background = element_blank(),
    panel.grid.major.y = element_line(color = "#DAE1E7"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_blank()
  ) 

p_value_one <- tibble(
  x = c("Asia", "Asia", "Europe", "Europe"),
  y = c(5.8, 6.1, 6.1, 5.8)
)

plot +
  geom_line(data = p_value_one,
            aes(x = x, y = y, group = 1)) +
  annotate("text", x = 3.5, y = 6.2,
           label = "***",
           size = 7)

# https://github.com/const-ae/ggsignif