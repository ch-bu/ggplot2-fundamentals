library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


labels <- world_bank_countries %>% 
  filter(
    country %in% c("United States", "Japan", "China", "India"),
    year == max(year)) %>% 
  select(country, year, co2_emissions_tons_per_capita)


world_bank_countries %>% 
  filter(country %in% c("United States", 
                        "Japan", "China", 
                        "India")) %>% 
  ggplot(aes(year, co2_emissions_tons_per_capita,
             color = country)) +
  geom_line() +
  geom_text(data = labels,
            aes(label = country),
            hjust = 0,
            nudge_x = 1) +
  # xlim(c(1955, 2020))
  scale_x_continuous(limits = c(1955, 2025)) +
  guides(
    color = "none"
  )


