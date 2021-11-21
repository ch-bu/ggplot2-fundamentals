library(tidyverse)

world_bank_countries <- read_csv("data/world_bank_countries.csv")


# date --------------------------------------------------------------------
us_gdp_date <- world_bank_countries %>% 
  filter(country == "United States") %>% 
  transmute(gdp_per_capita, year = as.Date(ISOdate(year, 1, 1)))

ggplot(us_gdp_date, aes(x = year, y = gdp_per_capita)) +
  geom_line()


# datetime ----------------------------------------------------------------
set.seed(34)
df_date <- tibble(date = seq(as.POSIXct('2012-02-09 00:00', tz = 'CET'),
                            as.POSIXct('2012-02-11 00:00', tz = 'CET'),
                            by = '60 min'), 
                 heart_rate = runif(49, min = 60, max = 180))

ggplot(df_date, aes(x = date, y = heart_rate)) +
  geom_line()


# time --------------------------------------------------------------------
library(hms)
set.seed(34)
df_time <- tibble(hours = hms(hours = 1:24), heart_rate = runif(24, min = 60, max = 180))
ggplot(df_time, aes(x = hours, y = heart_rate)) +
  geom_line()

