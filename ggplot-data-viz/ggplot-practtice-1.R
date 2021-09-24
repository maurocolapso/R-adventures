# first practice
# data from National Morbidity and Mortality Air Pollution Study (NMMAPS)
chic <- readr::read_csv("https://raw.githubusercontent.com/Z3tt/R-Tutorials/master/ggplot2/chicago-nmmaps.csv")

# :: allow you to use functions without load the package
tibble::glimpse(chic)

head(chic, 10)

library(tidyverse)

# ggplot sintaxis is "data", "axis" and geometri (what type of plot you want
# here is only the figure without the type of plot)
(g <- ggplot(chic, aes(x = date, y = temp))) # the parenthesis make the plot appear immediate

# scatter
g + geom_point()

# line
g + geom_line()

# you can combine point plus line
g + geom_line() + geom_point()

#you can change the color, markers inside geom
g + geom_point(color = "firebrick", shape = "diamond", size = 2)

g + geom_point(color = "firebrick", shape = "diamond", size = 2) +
  geom_line(color = "firebrick", linetype = "dotted", size = .3)

# change the theme of the plot
theme_set(theme_bw())
g + geom_point(color = "firebrick")

# manipulate labels and axis

ggplot(chic,aes(x = date, y = temp)) + 
  geom_point(color = 'firebrick') + 
  labs(x = 'Year',y='Temperature(°F)')
 
# further manipulation with themes (increase space between axis and labels)
ggplot(chic, aes(x = date, y = temp)) +
  geom_point(color = 'firebrick') +
  labs(x = "Year", y = 'Temperature (F)') +
  theme(axis.title.x = element_text(vjust=0, size=15),
        axis.title.y = element_text(vjust=2, size=15))

# using fonts outside the normal ones
library(showtext)
font_add_google("Playfair Display", ## name of Google font
                "Playfair")  ## name that will be used in R
font_add_google("Bangers", "Bangers")

ggplot(chic, aes(x = date, y = temp,color = season)) +
  geom_point() +
  labs(x = "Year", y = 'Temperature (F)',
       title = "Temperatures in Chicago",
       subtitle = 'Daily Tmperatures in F from 1997 to 2001') +
  theme(plot.title = element_text(hjust=.5,size=25),
        plot.subtitle = element_text(hjust=.5,size=25))
