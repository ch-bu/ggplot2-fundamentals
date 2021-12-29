library(tidyverse)
library(scales)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

world_bank_countries %>% 
  mutate(
    continent = as.factor(continent) %>%
      fct_relevel("Americas", "Europe",
                  "Africa", "Asia", "Oceania")
  ) %>%
  ggplot(aes(x = year, y = life_expectancy_at_birth)) +
  stat_summary(
    geom = "ribbon",
    fun.min = "min",
    fun.max = "max",
    fill = "#FCA5A5",
    alpha = .2
  ) +
  geom_line(aes(group = country), color = "#B91C1C", alpha = .4) +
  scale_fill_discrete(guide = "none") +
  scale_x_continuous(name = NULL,
                     expand = expansion(0),
                     breaks = seq(1970, 2010, 20)) +
  scale_y_continuous(breaks = seq(20, 90, 10),
                     limits = c(10, 90),
                     labels = label_number(suffix = " yrs")) +
  facet_wrap(~ continent, ncol = 5) +
  labs(
    title = "Good news: Life expectancy has been rising on all continents since 1965",
    subtitle = str_wrap(paste0("However, the differences in life expectancy",
    "between the continents remain large. The genocide in Rwanda and the",
    " Khmer Rouge in Cambodia also had a devastating impact on life expectancy",
    "in Africa and Asia."), 80),
    caption = "Source: Worldbank - World Development Indicator",
    x = "",
    y = ""
  ) +
  theme(
    text = element_text(family = "Source Sans Pro"),
    plot.margin = unit(rep(1, 4), "cm"),
    plot.title = element_text(face = "bold", size = 18,
                              margin = margin(b = 10)),
    plot.subtitle = element_text(size = 15, margin = margin(b = 40),
                                 lineheight = 1.1),
    plot.caption = element_text(size = 13, color = "grey20", 
                                margin = margin(t = 10)),
    strip.background = element_blank(), 
    strip.text = element_text(size = 16, margin = margin(b = 10),
                              face = "bold"),
    panel.background = element_rect(fill = "#F1F5F9", color = NA),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_line(linetype = "dotted", color = "grey70"),
    panel.spacing.x = unit(0.4, "cm"),
    axis.line.y = element_blank(),
    axis.line.x = element_line(color = "grey60")
  )
