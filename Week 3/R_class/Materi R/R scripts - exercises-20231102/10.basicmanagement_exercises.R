################################################################################
# BASIC DATA MANAGEMENT IN R - EXERCISES
################################################################################

################################################################################
# SECTIONS 1-2

## ####
## 1
## ####

# load the data
data(airquality)

# check the names
names(airquality)
# or
colnames(airquality)

# change the names
names(airquality) <- tolower(names(airquality))
names(airquality)

## ####
## 2
## ####

# load the data
data(mtcars)
#help(mtcars)

# subset
subset(mtcars, am==1 & wt>2.5, select=c(mpg:disp))
# or
mtcars[mtcars$am==1 & mtcars$wt>2.5, c("mpg","cyl","disp")]
# or
mtcars[mtcars$am==1 & mtcars$wt>2.5,][c("mpg","cyl","disp")]

## ####
## 3
## ####

# reorder and select
mtcars[order(mtcars$gear, mtcars$carb), c("mpg","hp","gear","carb")]

## ####
## 4
## ####

# import:
deprivation <- read.table("files/deprivation.txt", sep=" ", header=T)
# or use the menu in the Worspace window

# inspect names
names(deprivation)
names(esoph)

# merge
esoph2 <- merge(esoph, deprivation, by.x=c("agegp","tobgp"),
  by.y=c("age","tobacco"))
head(esoph2)

# or alternatively:
names(deprivation)[1:2] <- c("agegp","tobgp")
esoph2 <- merge(esoph, deprivation)
head(esoph2)

################################################################################
# SECTIONS 3-5

## ####
## 5
## ####

# load (and install if needed) Epi
#install.packages("Epi")
library(Epi)

# load births
data(births)

# two aggregations
birthsaggr1 <- aggregate(bweight ~ sex + hyp, births, length)
birthsaggr2 <- aggregate(bweight ~ sex + hyp, births, mean)

# rename columns
names(birthsaggr1)[3] <- "N"
names(birthsaggr2)[3] <- "bweightavg"

# merge
merge(birthsaggr1, birthsaggr2)

## ####
## 6
## ####

# without pipes
aggregate(cbind(mpg, cyl) ~ vs + gear, data=subset(mtcars, wt<3), FUN=mean)$mpg

# with pipes
mtcars |>
  subset(wt<3) |>
  aggregate(cbind(mpg, cyl) ~ vs + gear, data=_, FUN=mean) |>
  _$mpg

## ####
## 7
## ####

# inspect the coding:
#?births
head(births)

births <- transform(births,
  lowbw = factor(lowbw, labels=c("no","yes")),
  preterm = factor(preterm, labels=c(">=37weeks","<37weeks")),
  hyp = factor(hyp, labels=c("no","yes")),
  sex = factor(sex, labels=c("male","female"))
)
head(births,5)

## ####
## 8
## ####

# define mpggp
summary(mtcars$mpg)
mtcars$mpggp <- cut(mtcars$mpg, breaks=c(0,20,30,50))

# transform gear
table(mtcars$gear)
mtcars$gear <- factor(mtcars$gear)

# redefine categories
levels(mtcars$gear) <- c("3", "4 and more", "4 and more")

# summary
summary(mtcars$mpggp)
summary(mtcars$gear)
