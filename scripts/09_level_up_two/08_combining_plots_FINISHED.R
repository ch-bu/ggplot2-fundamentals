library(tidyverse)
library(patchwork)
# install.packages("devtools")
# devtools::install_github("thomasp85/patchwork")

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Theme -------------------------------------------------------------------
base_theme <- theme(
  plot.margin = unit(rep(1, 4), "cm"),
  plot.title = element_text(size = 15),
  plot.subtitle = element_text(margin = margin(b = 10), size = 13),
  axis.title.x = element_text(margin = margin(t = 10)),
  axis.title.y = element_text(margin = margin(r = 10)),
  axis.line = element_line(color = "black"),
  panel.background = element_blank(),
  panel.grid = element_blank(),
  legend.position = "bottom",
  legend.text = element_text(size = 10),
  legend.key = element_rect(fill = NA),
  axis.text = element_text(size = 12, color = "black"),
  axis.title = element_text(face = "bold", size = 12)
)

set_base_theme <- function() {
  theme_set(theme_grey(base_size = 12) +
              base_theme)
}

set_default_theme <- function() {
  theme_set(theme_grey())
}

# Plots -------------------------------------------------------------------
(fl1 <- world_bank_countries %>% 
   filter(year == 2017) %>% 
   ggplot(aes(x = forest_land, y = agricultural_land,
              size = population_total)) + 
   geom_point(alpha = .8) +
   scale_y_continuous(limits = c(0, 100)) +
   theme(
     legend.position = "bottom"
   ) +
   labs(
     x = "Forest land in %",
     y = "Agricultural land in %"
   ))

(fl2 <- world_bank_countries %>% 
    filter(year == 2017) %>% 
    ggplot(aes(x = forest_land)) +
    geom_histogram(fill = "grey50", color = "black", alpha = .7) +
    scale_y_continuous(expand = expansion(0)) +
    labs(
      x = "Forest land in %"
    ))


(fl3 <- world_bank_countries %>% 
    mutate(year = as.factor(year)) %>% 
    filter(year %in% c(1990, 2000, 2015)) %>%
    ggplot(aes(x = continent, y = agricultural_land, fill = year)) +
    geom_boxplot(alpha = .8) +
    scale_fill_viridis_d(begin = 0.2)
)



# Combining plots ---------------------------------------------------------

# Side by side
fl1 + fl2 + fl3

# On top of each other
fl1 / fl2 / fl3

# Grid
fl1 / (fl2 + fl3)

# plot_layout()
fl1 + fl2 + fl3 +
  plot_layout(
    nrow = 2,
    ncol = 2
  )

# layout
layout <- "
AAAA
BCCC
"

fl1 + fl2 + fl3 +
  plot_layout(
    design = layout
  )