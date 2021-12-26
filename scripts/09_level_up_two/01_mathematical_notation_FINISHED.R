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
    # x = expression(x[2])
    # x = TeX(r'(x_2)')
    # x = expression(paste("This is the formula: ", x^2, "and some text"))
    x = TeX(r'(This is the formula x^2 and some text)')
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
    # x = expression(paste(alpha, " is a Greek symbol"))
    x = TeX(r'($\alpha$ is a Greek symol)')
  ) +
  theme(
    axis.title.x = element_text(size = 20)
  )


# Fractions ---------------------------------------------------------------
ggplot(plot_data,
       aes(x, y)) +
  geom_point() +
  labs(
    # x = expression(paste("This is a fraction: ", frac(alpha, 3)))
    # x = TeX(r'(This is a fraction $\frac{\alpha}{3}$)')
  ) +
  theme(
    axis.title.x = element_text(size = 20)
  )


# Square roots ------------------------------------------------------------
ggplot(plot_data,
       aes(x, y)) +
  geom_point() +
  labs(
    # x = expression(paste("This is a square root: ", sqrt(9)))
    x = TeX(r'(This is a square root $\sqrt[4]{9}$)')
  ) +
  theme(
    axis.title.x = element_text(size = 20)
  )
