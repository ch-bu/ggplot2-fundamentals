library(tidyverse)
library(latex2exp) # install.packages('latex2exp')


plot_data <- tibble(
  x = c(1, 2, 3)**2,
  y = c(1, 2, 3)
)

# Super- and subscripts ---------------------------------------------------
ggplot(plot_data,
       aes(x, y)) +
  geom_point() +
  labs(
    x = "Code goes here"
  ) +
  theme(
    axis.title.x = element_text(size = 20)
  )


# Greek symbols -----------------------------------------------------------
# https://web.mit.edu/jmorzins/www/greek-alphabet.html
ggplot(plot_data,
       aes(x, y)) +
  geom_point() +
  labs(
    x = "Code goes here"
  ) +
  theme(
    axis.title.x = element_text(size = 20)
  )


# Fractions ---------------------------------------------------------------
ggplot(plot_data,
       aes(x, y)) +
  geom_point() +
  labs(
    x = "Code goes here"
  ) +
  theme(
    axis.title.x = element_text(size = 20)
  )


# Square roots ------------------------------------------------------------
ggplot(plot_data,
       aes(x, y)) +
  geom_point() +
  labs(
    x = "Code goes here"
  ) +
  theme(
    axis.title.x = element_text(size = 20)
  )
