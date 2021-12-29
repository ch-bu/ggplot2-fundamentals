library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Theme -------------------------------------------------------------------
base_theme <- theme(
  plot.margin = unit(rep(1.2, 4), "cm"),
  plot.title = element_text(size = 15),
  plot.subtitle = element_text(margin = margin(b = 10), size = 13),
  axis.title.x = element_text(margin = margin(t = 10)),
  axis.title.y = element_text(margin = margin(r = 10)),
  axis.line = element_line(color = "grey40"),
  panel.background = element_blank(),
  panel.grid = element_blank(),
  legend.position = "bottom",
  legend.text = element_text(size = 10),
  legend.key = element_rect(fill = NA),
  axis.text = element_text(size = 15, color = "black"),
  axis.title = element_text(face = "bold", size = 12)
)

set_base_theme <- function() {
  theme_set(theme_grey(base_size = 12) +
              base_theme)
}

set_default_theme <- function() {
  theme_set(theme_grey())
}

set_base_theme()


# Plot --------------------------------------------------------------------
(myplot <- world_bank_countries %>% 
    filter(country %in% c("United States", 
                          "Japan", "China", 
                          "India")) %>% 
    ggplot(aes(year, co2_emissions_tons_per_capita,
               color = country)) +
    geom_line() +
    geom_text(data = labels, aes(label = country),
              hjust = 0, nudge_x = 1, size = 5) +
    guides(
      color = "none"
    ) +
    labs(
      x = "",
      y = "CO2 emissions (tons per capita)"
    ) +
    scale_x_continuous(limits = c(1960, 2030),
                       expand = expansion(0)) +
    theme(
      plot.margin = unit(rep(1, 4), "cm")
    ))


# Exporting plot ----------------------------------------------------------
aspect_ratio <- 2
height <- 15

ggsave(
  filename = "image/myplot.png",
  plot = myplot,
  dpi = 320,
  width = height * aspect_ratio,
  height = height,
  unit = "cm"
)

