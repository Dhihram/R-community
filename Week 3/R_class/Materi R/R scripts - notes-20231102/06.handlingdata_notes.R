################################################################################
# HANDLING DATA IN R
################################################################################

################################################################################
# LOADING DATA

# Practical session: managing real data

## # many datasets already stored in R packages
## data()

# packages available to use without loading them in the global environment
# to load a package and make it visible:
data(esoph)

# check the Environment window

## # install a contributed package
## install.packages("Epi")

# now load the package and data
library("Epi")
data(births)

## # help page for data objects
## help(births)

# data can also be inputed manually with functions such as scan() or readline()
# luckily, datasets are rarely created manually

################################################################################
# R DATA FORMATS

# import by loading an RData file
load("files/mtcars.RData")

# import by reading an RDS file
airquality <- readRDS("files/airquality.RDS")

################################################################################
# IMPORTING DATA IN DIFFERENT FORMATS

# basic function for importing tabular data is:
faithful <- read.table("files/faithful.txt", header=TRUE, sep=",")

# arguments header and sep

# wrapper functions:
faithful <- read.csv("files/faithful.txt")
# or read.delim() for 

# import a data in Stata format
library(foreign)
sleep <- read.dta("files/sleep.dta")

#########################################
## Exercises
#########################################

################################################################################
# DISPLAYING AND SUMMARISING DATA

## # visualizing a dataset (or other R objects)
## View(births)

# simpler with RStudio: click on the object in the Environment window

# only the first n lines
head(mtcars, 3)

tail(mtcars, 4)

# the structure of an object
str(esoph)

# summarising a variable
summary(births$gestwks)

# summarising the entire object
summary(sleep)

################################################################################
# EXPORTING DATA

# exporting data follows the same lines than importing
save(births, file="files/births.RData")

# saving a workspace with a single (or multiple) datasets
save.image("files/all.RData")

# save as text files
write.table(esoph, "files/esoph.txt", sep=",")

## # alternatively, use the wrapper for csv files
## write.csv(esoph, "files/esoph.csv")

# load a dta file (Stata format)
write.dta(airquality, file="files/airquality.dta")

#########################################
## Exercises
#########################################
