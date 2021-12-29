library(tidyverse)

world_bank_income <- read_csv("data/world_bank_income.csv")

world_bank_income %>% 
  filter(year == 2014) %>% 
  ggplot(aes(x = income_group,
             y = co2_emissions_tons_per_capita)) +
  geom_col()


# Reorder with factors ----------------------------------------------------
income_groups_co2 <- world_bank_income %>% 
  filter(year == 2014) %>% 
  select(income_group, co2_emissions_tons_per_capita) %>% 
  mutate(
    income_group = as_factor(income_group) %>% 
      fct_relevel("Low income", "Lower middle income", 
                  "Middle income", "Upper middle income", "High income")
  )

income_groups_co2 %>% 
  ggplot(aes(x = income_group,
             y = co2_emissions_tons_per_capita)) +
  geom_col()

# Reorder with the reorder function ---------------------------------------
world_bank_income %>% 
  filter(year == 2014) %>% 
  ggplot(aes(x = reorder(income_group, co2_emissions_tons_per_capita),
             y = co2_emissions_tons_per_capita)) +
  geom_col()

# Reorder with the fct_reorder function -----------------------------------
world_bank_income %>% 
  filter(year == 2014) %>% 
  ggplot(aes(x = fct_reorder(income_group, -co2_emissions_tons_per_capita),
             y = co2_emissions_tons_per_capita)) +
  geom_col()

