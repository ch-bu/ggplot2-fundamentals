library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")
size_annotation <- 4
line_color <- "grey30"


# Trick for key spacing ---------------------------------------------------
# https://github.com/tidyverse/ggplot2/issues/2844
draw_key_polygon3 <- function(data, params, size) {
  lwd <- min(data$size, min(size) / 4)
  
  grid::rectGrob(
    width = grid::unit(0.7, "npc"),
    height = grid::unit(0.7, "npc"),
    gp = grid::gpar(
      col = data$colour,
      fill = alpha(data$fill, data$alpha),
      lty = data$linetype,
      lwd = lwd * .pt,
      linejoin = "mitre"
    ))
}


# Plot --------------------------------------------------------------------
world_bank_areas %>% 
  filter(area != "World") %>% 
  mutate(
    internet_users = internet_usage * population_total
  ) %>% 
  ggplot(aes(x = year,
             y = internet_users,
             fill = area)) +
  # 1993 - Tim Berners-Lee
  annotate(
    "text", x = 1991.3, y = 0.7e11, 
    label = "1993\nTim Berners-Lee\npublishes the\nfirst website",
    size = size_annotation,
    hjust = 0,
    vjust = 1
  ) +
  annotate(
    "segment", x = 1991, xend = 1991, y = 0, yend = 0.7e11,
    linetype = "dashed", color = line_color
  ) +
  # 1998 - Google is launched
  annotate("segment", x = 1998, xend = 1998, y = 0, yend = 0.9e11,
           linetype = "dashed", color = line_color) +
  annotate("text", x = 1998.2, y = 0.9e11, label = "1998\nGoogle goes\nonline",
           hjust = 0, size = size_annotation, vjust = 1) +
  
  # 2001 - Wikipedia
  annotate("segment", x = 2001, xend = 2001, y = 0, yend = 1.3e11,
           linetype = "dashed", color = line_color) +
  annotate("text", x = 2001.2, y = 1.3e11, label = "2001\nWikipedia goes\nonline",
           hjust = 0, size = size_annotation, vjust = 1) +
  
  # 2005 - YouTube 
  annotate("segment", x = 2005, xend = 2005, y = 0, yend = 2e11,
           linetype = "dashed", color = line_color) +
  annotate("text", x = 2005.2, y = 2e11, label = "2005\nYouTube\ngoes\nonline",
           hjust = 0, size = size_annotation, vjust = 1) +
  
  # 2007 - iPhone 
  annotate("segment", x = 2007, xend = 2007, y = 0, yend = 2.5e11,
           linetype = "dashed", color = line_color) +
  annotate("text", x = 2007.2, y = 2.5e11, label = "2007\nApple intro-\nduces the\niPhone",
           hjust = 0, size = size_annotation, vjust = 1) +
  
  # 2010 - Instragram 
  annotate("segment", x = 2010, xend = 2010, y = 0, yend = 3.1e11,
           linetype = "dashed", color = line_color) +
  annotate("text", x = 2010.2, y = 3.1e11, label = "2010\nInstagram\ngoes online",
           hjust = 0, size = size_annotation, vjust = 1) +
  geom_area(alpha = .9, key_glyph = "polygon3") +
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


ggsave(
  filename = "final_plots/internet_usage.png",
  dpi = 320,
  width = 14,
  height = 11
)