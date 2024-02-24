################################################################################
# ADVANCED GRAPHICS IN R
################################################################################

################################################################################
# INTRODUCTION TO GGPLOT2

# install the whole set of tidyverse packages (uncomment if needed)
#install.packages("tidyverse")

# load the package
library(ggplot2)

################################################################################
# STRUCTURE OF GGPLOT2

# define the bacis plot structure with ggplot
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg))

# function aes() to map variables to aesthetics 
# x and y are the two main aesthetics

# add a geom
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + geom_po()

# comparison with base graphics
plot(mpg ~ wt, mtcars)

# still simple, without colours and basic labelling
# however, ggplot2 default has better spacing, magnification, background/grid

################################################################################
# USING DIFFERENT GEOMS

# install the package Epi
#install.packages("Epi")

# load the package Epi and dataframe births
library(Epi)
data(births)

# another scatter plot, but with non-default values for aesthetics
ggplot(births, aes(x=gestwks, y=bweight)) +
  geom_point(colour="purple", shape=20, size=5, alpha=0.2)+theme_minimal()

# multiple calls to different geoms
library(dplyr)
filter(airquality, Month==6) |>
  ggplot(aes(x=Day,y = Temp)) +
  geom_line(linetype="dotdash", linewidth=0.5) +
  geom_point(shape=22, size= 3, fill="green")

# note the chain of expressions including pipes '|>' and '+' 

# other geoms
ggplot(mtcars, aes(x=carb)) + geom_bar(col=1, fill=3)
ggplot(births, aes(x=bweight)) + geom_histogram(col=1, fill="lightskyblue")
ggplot(esoph, aes(agegp, ncases)) + geom_boxplot(fill=4)

################################################################################
# AESTHETIC SETTING AND MAPPING

# mapping vs setting aesthetics

# mapping other aesthetics in addition to x and y
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg, col=factor(gear))) + 
  geom_point(size=4)

# note the automatic addition of a legend

# exclude the legend
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg, col=factor(gear))) + 
  geom_point(size=4, show.legend=F)

# mapping the same variables to multiple aesthetics
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + 
  geom_point(aes(col=factor(gear), shape=factor(gear)), size=4)

# mapping different variables (note the creation of multiple legends)
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + 
  geom_point(aes(col=factor(gear), shape=factor(vs)), size=4)

# global and local mapping
# inheritance for all the layers

# add fitting lines to each group with global mapping
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg, col=factor(gear))) + 
  geom_point(size=4) +
  geom_smooth(method="lm")

# define a single fitting line with local mapping
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + 
  geom_point(aes(col=factor(gear)), size=4) +
  geom_smooth(method="lm", col=1)

# overruling inheritance through additional aes() call or with inherit.aes=F
# also apply to data argument, which can be defined locally in each geom

################################################################################
# SCALING AND THEMES

# saving a ggplot graph to an object
basic <- ggplot(data=mtcars, mapping=aes(x=wt, y=mpg, col=factor(gear))) + 
  geom_point(size=4)

# non-default scale for the x-axis
basic + scale_x_continuous(n.breaks=10)

# non-default scale for colours
basic + scale_colour_brewer(name="Gears (N)", palette="Greens")

# modify the theme
basic + scale_colour_brewer(name="Gears (N)", palette="Greens") +
  theme(legend.position="top")

# pre-defined themes
basic + scale_colour_brewer(name="Gears (N)", palette="Greens") + theme_bw()
basic + scale_colour_brewer(name="Gears (N)", palette="Greens") + theme_classic()
basic + scale_colour_brewer(name="Gears (N)", palette="Greens") + theme_dark()
basic + scale_colour_brewer(name="Gears (N)", palette="Greens") + theme_minimal()


################################################################################
# LABELS, COORDINATE SYSTEM, AND FACETING

# add labels
basic + labs(title="A title here", caption="Footnote here", 
  x="Weight (x 1000 lb", y="Miles per gallon")

# change the axis ranges (also coord_cartesian())
basic + xlim(3,4) + ylim(15,20)

# faceting
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + geom_point(size=4) +
  facet_wrap(vars(am), nrow=1)

# using patchwork
library(patchwork)
left <- basic + labs(title="A title here")
right <- basic + xlim(3,4) + ylim(15,20)
left + right
left/right
left/(right+right)

################################################################################
# EXPORTING GRAPHS

# exporting graphs
ggsave("myggplot.pdf", plot=basic, width=8, height=7)
