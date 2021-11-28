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
                     guide = "none")