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

# other high-level functions: an histogram
hist(births$bweight, breaks=20, col=2, xlab="Birth weight (gr)", main="An histogram")

# a QQ-plot
qqnorm(births$bweight)

# a bar plot
barplot(table(births$lowbw), horiz=TRUE, las=1, xlab="Frequency", 
        ylab="Number of gears", main="A bar plot")

# a bar plot
pie(table(births$lowbw), col=2:4, main="A pie chart")

# a box plot
boxplot(ncases~agegp, data=esoph, xlab="Age group", ylab="Number of cases", 
        ylim=c(0,10), col=4, boxwex=0.5, main="A box plot")

# an example of layout
layout(t(1:3))
barplot(table(births$lowbw), horiz=TRUE, las=1, xlab="Frequency", 
        ylab="Number of gears", main="A bar plot")
hist(births$bweight, breaks=20, col=2, xlab="Birth weight (gr)", main="An histogram")
boxplot(ncases~agegp, data=esoph, xlab="Age group", ylab="Number of cases", 
        ylim=c(0,10), col=4, boxwex=0.5, main="A box plot")
layout(1)
