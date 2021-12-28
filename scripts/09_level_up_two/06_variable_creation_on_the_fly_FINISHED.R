library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# Birth rate in a couple of countries vs. the rest of the world -----------
world_bank_countries %>% 
  ggplot(aes(x = year, y = birth_rate, 
             color = country %in% c("Germany", "Switzerland",
                                    "France", "Austria"))) +
  stat_summary(
    geom = "line",
    fun = "mean"
  )


# Women in parliament in Europe vs. the rest of the world ------------------
world_bank_countries %>% 
  ggplot(aes(x = year,
             y = women_in_national_parliaments,
             color = continent == "Europe")) + 
  stat_summary(
    fun = "mean",
    geom = "line"
  )


# Women in national parliaments compared to gdp per capita ----------------
world_bank_countries %>% 
  filter(year == 2017) %>% 
  drop_na(gdp_per_capita) %>% 
  ggplot(aes(x = continent, y = women_in_national_parliaments,
             fill = gdp_per_capita > 30000)) +
  stat_summary(
    geom = "bar",
    fun = "mean",
    width = .6,
    position = position_dodge2(padding = 0)
  )