library(tidyverse)


# A simple example --------------------------------------------------------
ggplot(data.frame(x = c(-20, 20)), aes(x)) +
  stat_function(
    fun = function(x) {  x**3 },
    geom = "line"
  )


# The normal distribution -------------------------------------------------
ggplot(data.frame(x = c(-5, 5)), aes(x)) +
  stat_function(
    fun = dnorm,
    geom = "line"
  )

# Area charts -------------------------------------------------------------
ggplot(data.frame(x = c(-5, 5)), aes(x)) +
  stat_function(
    fun = dnorm,
    geom = "area",
    alpha = .5,
    fill = "steelblue"
  )

# Arguments ---------------------------------------------------------------
ggplot(data.frame(x = c(20, 180)), aes(x)) +
  stat_function(
    fun = dnorm,
    geom = "line",
    args = list(
      mean = 100,
      sd = 20
    )
  )


# Layering ----------------------------------------------------------------
ggplot(data.frame(x = c(20, 180)), aes(x)) +
  stat_function(
    fun = dnorm,
    geom = "line",
    args = list(
      mean = 100,
      sd = 20
    ),
    color = "red"
  ) +
  stat_function(
    fun = dnorm,
    geom = "line",
    args = list(
      mean = 110,
      sd = 25
    ),
    color = "steelblue"
  )



# What about specific limits of a function --------------------------------
ggplot(data.frame(x = c(-5, 5)), aes(x)) +
  stat_function(
    fun = dnorm,
    geom = "line",
    alpha = .5,
    fill = "steelblue",
    xlim = c(-3, -1)
  ) +
  stat_function(
    fun = dnorm,
    geom = "area",
    alpha = .5,
    fill = "steelblue",
    xlim = c(-1, 3)
  ) +
  xlim(-3, 3)
