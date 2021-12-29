library(tidyverse)

# Aesthetics of geometric objects: A point
ggplot(NULL, aes(x = c(1:10), y = 1:10)) + 
  annotate(geom = "point", x = 5, y = 5,
           size = 60,
           color = "steelblue",
           alpha = .2) +
  theme_void()

# Aesthetics of geometric objects: A rectangle
ggplot(NULL, aes(x = c(1:10), y = 1:10)) + 
  annotate(geom = "rect", xmin = 4, xmax = 7,
           ymin = 4, ymax = 7,
           fill = "steelblue",
           alpha = .3,
           color = "yellow",
           size = 10) +
  theme_void()

# Aesthetics of geometric objects: A line
ggplot(NULL, aes(x = c(1:10), y = 1:10)) + 
  annotate(geom = "segment", x = 4, xend = 7,
           y = 4, yend = 7,
           size = 10,
           color = "red",
           alpha = .3) +
  theme_void()