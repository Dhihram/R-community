################################################################################
# BASIC DATA MANAGEMENT IN R
################################################################################

################################################################################
# LABELLING, SUBSETTING, AND REORDERING DATASETS

# have a look at esoph
head(esoph, 3)

# labelling
names(esoph) <- c("age", "alcohol", "tobacco", "cases", "controls")

# same with colnames(), while rownames() for rows

# subsetting
subset(esoph, age=="55-64" & tobacco %in% c("10-19","20-29"), 
  select=c(alcohol, tobacco, cases, controls))

# alternatives
subset(esoph, age=="55-64" & tobacco %in% c("10-19","20-29"), 
  select=c(alcohol, tobacco:controls))
subset(esoph, age=="55-64" & tobacco %in% c("10-19","20-29"), 
  select=-age)

# simply using indexing
esoph[esoph$age=="55-64" & esoph$tobacco %in% c("10-19","20-29"), 
  c("alcohol", "tobacco", "cases", "controls")]

# reordering rows and columns
ord <- with(esoph, order(tobacco, alcohol, age))
esoph <- esoph[ord, c(3:1,4:5)]

################################################################################
# APPENDING, MERGING, AND RESHAPING DATASETS

# have a look at mtcars
head(mtcars, 3)

# an example of appending with rbind()
rbind(mtcars[1:2,], mtcars[1:2,])

# create a score for forward gears related to mtcars
gearscore <- data.frame(gear=3:6, score=c(2.1, 7.5, 8.1, 8.3))

# merging
merge(mtcars, gearscore, by="gear")

# arguments by.x, by.y, all, all.x, all.y

# let's have a look to sleep
head(sleep, 3)

# reshaping from long to wide
sleepwide <- reshape(sleep, idvar="ID", v.names="extra", timevar="group",
  direction="wide")
head(sleepwide, 3)

# comment
reshape(sleepwide, idvar="ID", v.names="extra", timevar="group",
  direction="long")

#########################################
## Exercises
#########################################

################################################################################
# AGGREGATING DATASETS

# the function aggregate()
# two different usages: x and by, formula and data

# a simple aggregation
aggregate(mpg ~ vs + am, data=mtcars, FUN=mean)

# more complex aggregation passing arguments internally
aggregate(mpg ~ vs + am, data=mtcars, FUN=quantile, probs=c(0.25, 0.75))

# aggregating more variables
aggregate(cbind(mpg, hp, wt) ~ vs + am, data=mtcars, FUN=max)
# however, limitation of using a single aggregating function

################################################################################
# CREATING AND TRANSFORMING VARIABLES

# creating a variable
rm(esoph)
data(esoph)
esoph$tot <- with(esoph, ncases+ncontrols)
esoph["tot"] <- with(esoph, ncases+ncontrols)

# revoving a variable by assigning it to NULL
esoph$tot <- NULL

# use of transform
esoph <- transform(esoph,
  tot = ncases+ncontrols,
  prop = ncases/(ncases+ncontrols),
  odds = ncases/ncontrols
)

################################################################################
# DEALING WITH CATEGORICAL DATA

# load the package Epi and births (uncomment if needs installing)
#install.packages("Epi")
library(Epi)
data(births)

# use factor() to define categorical variables
head(births$hyp)
births$hyp <- factor(births$hyp, labels=c("n", "y"))
head(births$hyp)

# renaming the categories
levels(births$hyp) <- c("no","yes")
head(births$hyp)

# re-ordering the categories
births$hyp <- factor(births$hyp, levels=c("yes","no"))
head(births$hyp)

# or directly from the numeric indicator
rm(births)
data(births)
births$hyp <- factor(births$hyp, levels=1:0, labels=c("yes","no"))
head(births$hyp)

# creating a categorical variable
births$matagegr <- cut(births$matage, breaks=c(0,25,30,35,40,100), right=F)
head(births$matage)
head(births$matagegr)

# recoding a categorical variable
levels(births$matagegr)[2:3] <- "[25,35)"
head(births$matagegr)

#########################################
## Exercises
#########################################
