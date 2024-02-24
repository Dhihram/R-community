################################################################################
# BASE GRAPHICS IN R - EXERCISES
################################################################################

################################################################################
# SECTION 2

## ####
## 1
## ####

# load the data
data(airquality)

# check the names
names(airquality)
# or
colnames(airquality)

# plots
plot(Ozone ~ Temp, airquality)
plot(Ozone ~ Wind, airquality)

## ####
## 2
## ####

# box plot of ozone by month
plot(Ozone ~ Month, airquality)
# not treated as a factor: it's a scatterplot
plot(Ozone ~ factor(Month), airquality)

# categotise temperature
summary(airquality$Temp)
cutoff <- quantile(airquality$Temp)
airquality$tempcat <- cut(airquality$Temp, breaks=cutoff, include.lowest=T)

# box plot of ozone by categorical temperature
plot(Ozone ~ tempcat, airquality)

################################################################################
# SECTIONS 3-4

## ####
## 3
## ####

# among other choices:
plot(Ozone ~ Temp, airquality, xlim=c(50,100), ylim=c(0,180),
  xlab="Temperature", ylab="Ozone", pch=21, bg=4, cex=0.8, 
  cex.axis=0.7, main="Relationships between ozone and temperature")

## ####
## 4
## ####

# check par
#?par
par("lab")

# plot with modified lab parameter
plot(Ozone ~ Temp, airquality, xlim=c(50,100), ylim=c(0,180),
  xlab="Temperature", ylab="Ozone", pch=21, bg=4, cex=0.8, 
  cex.axis=0.7, main="Relationships between ozone and temperature",
  lab=c(10,5,7))

## ####
## 5
## ####

hist(airquality$Wind)

# some improvements:
hist(airquality$Wind, breaks=15, xlab="Wind speed (mph)", xlim=c(0,24), col=2,
  main="Distribution of daily wind speed")

################################################################################
# SECTIONS 5-7

## ####
## 6
## ####

# same as before, but with type="n"
plot(Ozone ~ Temp, airquality, xlim=c(50,100), ylim=c(0,180),
  xlab="Temperature", ylab="Ozone", pch=21, bg=4, cex=0.8, 
  cex.axis=0.7, main="Relationships between ozone and temperature",
  lab=c(10,5,7), type="n")

# add the grid and then the points
grid(lwd=1.5)
points(Ozone ~ Temp, airquality, pch=22, bg=3, cex=0.8)

## ####
## 7
## ####

pdf("files/mygraph.pdf",height=6,width=9)

plot(Ozone ~ Temp, airquality, xlim=c(50,100), ylim=c(0,180),
  xlab="Temperature", ylab="Ozone", pch=21, bg=4, cex=0.8, 
  cex.axis=0.7, main="Relationships between ozone and temperature",
  lab=c(10,5,7), type="n")
grid(lwd=1.5)
points(Ozone ~ Temp, airquality, pch=22, bg=3, cex=0.8)

dev.off()

# alternatively, use the Export menu in RStudio
