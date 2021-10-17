library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")

birth_rate_china <- world_bank_countries %>% 
  filter(country == "China") %>% 
  select(year, birth_rate) %>% 
  mutate(
    highest_birth_rate = case_when(
      birth_rate > 40  ~ "Highest birth rate\nin China",
      year == 1987 ~ "Another rise in 1987",
      TRUE ~ ""
    )
  )


birth_rate_china %>% 
  ggplot(aes(x = year,
             y = birth_rate)) +
  geom_area(fill = "grey70", alpha = .5, 
            color = "grey30") +
  geom_point() +
  geom_text(aes(label = highest_birth_rate),
            nudge_y = 2)