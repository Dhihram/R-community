################################################################################
# BASE GRAPHICS IN R
################################################################################

################################################################################
# OVERVIEW OF BASE GRAPHICS IN R

# different graphic systems
# an ink-on-paper model
# high-level and low-level functions

################################################################################
# THE PLOT FUNCTION

# the plot functions: two different usages and syntaxes
# elementary or high-level

# install the package Epi
#install.packages("Epi")

# load the package Epi and dataframe births
library(Epi)
data(births)

# an example with the births dataset: a scatter plot
plot(bweight~gestwks, data=births)

# alternative usage with x and y syntax
plot(births$gestwks, births$bweight)
with(births, plot(gestwks, bweight))

# an elementary graph: points, axes, labels
# outer margins, figure region, plot region

# plot() has an object-oriented behaviour

# try with a numeric vector
plot(Temp ~ Day, data=subset(airquality, Month==6))

# try with a factor
plot(factor(mtcars$carb))

# try with a numeric vector and a factor
plot(ncases ~ agegp, data=esoph)

# result dependent on the class of the objects used as arguments
# simple and consistent syntax to obtain various graphical outputs

# Simpler in RStudio
# Plots window, back/forth, and Zoom button

#########################################
## Exercises
#########################################

################################################################################
# GRAPHICAL PARAMETERS

# graphical parameters: changed through arguments
# improving the scatter plots

# changing the features of the scatter plot
plot(bweight~gestwks, data=births, xlab="Gestational week", ylab="Birth weight (gr)",
  xlim=c(25,45), pch=19, frame.plot=FALSE, col="red", cex=0.7)

# another example with a the scatter plot
plot(Temp ~ Day, data=subset(airquality, Month==6), type="o", ylab="Temperature",
  ylim=c(55,105), lty=2, lwd=1.5, pch=22, bg="green", cex=1.4)

# improving the scatter plot
plot(ncases~agegp, data=esoph, xlab="Age group", ylab="Number of cases", ylim=c(0,10),
  col=4, cex.axis=1.2, cex.lab=1.5, main="Number of cases by age categories")

# set of pre-define colours using a palette
palette()

# pre-defined set of graphical parameters
par(c("cex","col"))

# permanent changes to graphical parameters
plot(1:10)
par(cex=1.5, col="blue")
plot(1:10)
# close the graphic device to reset the parameters, or:
par(cex=1, col="black")

# list of graphical parameters
#par()
#help(par)

################################################################################
# OTHER HIGH-LEVEL FUNCTIONS

# other high-level functions: an histogram
hist(births$bweight, breaks=20, col=2, xlab="Birth weight (gr)", main="An histogram")

# a QQ-plot
qqnorm(births$bweight)

# a bar plot
barplot(table(mtcars$gear), horiz=TRUE, las=1, xlab="Frequency", 
  ylab="Number of gears", main="A bar plot")

# a bar plot
pie(table(mtcars$gear), col=2:4, main="A pie chart")

# a box plot
boxplot(ncases~agegp, data=esoph, xlab="Age group", ylab="Number of cases", 
  ylim=c(0,10), col=4, boxwex=0.5, main="A box plot")

#########################################
## Exercises
#########################################

################################################################################
# LOW-LEVEL FUNCTIONS

# use of low-level functions to add graphical features to existing graph

# create a graph step by step 
plot(bweight~gestwks, data=births, type="n", xlab="", ylab="Birth weight (gr)",
  xlim=c(25,45), frame.plot=FALSE, xaxt="n")
title(main="Birth weight vs. gestational month", xlab="Month")
axis(1, at=6:10*4.33, labels=6:10)
points(bweight~gestwks, data=births, pch=23, bg=7)

# an example of abline
qqnorm(births$bweight)
abline(v=0, lty=5)
abline(h=median(births$bweight), lty=5)

# other low-level functions
plot(0:10,0:10, type="n", ann=FALSE)
legend("topright", c("a line","a point"), lty=c(2,NA), pch=c(NA,19),
  col=2:3, inset=0.05)
segments(x0=1:4, y0=6.5:9.5, x1=6, y1=6.5:9.5, col=4)
polygon(x=1+0:40/10, y=3+(-20:20/15)^3, col=2)
text(x=8, y=5:2, labels=c("We draw:", "- a legend", "- some segments", "- a polygon"))

# the 'add' arguments (also with par())
hist(births$bweight, breaks=20, col=grey(0.9), xlab="Birth weight (gr)", xlim=c(0,6000),
  freq=F, main="An histogram with reference normal density curve")
curve(expr=dnorm(x, mean=mean(births$bweight), sd=sd(births$bweight)), add=TRUE,
  col=4, lwd=2)

################################################################################
# SPECIAL GRAPHS

# more sophisticated graphs available: multi-figure, 3D, maps

# an example of layout
layout(t(1:3))
plot(Temp ~ Day, data=subset(airquality, Month==6))
plot(factor(mtcars$carb))
plot(ncases ~ agegp, data=esoph)
layout(1)

# Using mathematical and other symbols in text
plot(Temp ~ Day, data=subset(airquality, Month==6),
  ylab=expression(paste("Temperature ("*degree,"F)")))
#help(plotmath)

# three-dimensional graph
z <- 2 * volcano        # Exaggerate the relief
x <- 10 * (1:nrow(z))   # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z))   # 10 meter spacing (E to W)
persp(x, y, z, theta=135, phi=30, col="green3", scale=FALSE, ltheta=-120, 
  shade=0.75, border=NA, box=FALSE)
#help(persp)

################################################################################
# EXPORTING GRAPHS

# exporting graphs
pdf("files/barplot.pdf", width=7, height=7)
plot(ncases ~ agegp, data=esoph)
dev.off()

# or with the menu in RStudio

#########################################
## Exercises
#########################################
