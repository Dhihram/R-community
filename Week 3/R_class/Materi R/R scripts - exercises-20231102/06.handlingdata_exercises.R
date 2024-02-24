################################################################################
# HANDLING DATA IN R - EXERCISES
################################################################################

################################################################################
# SECTIONS 1-3

## ####
## 1
## ####

data(swiss)

## ####
## 2
## ####

filepath <- "files/births.RData"
load(filepath)

# NB: this dataset was saved from  dataset births in the Epi package,
# just in case you want to have a look at the help page

# alternatively, you can use 'Load workshpage' in the Workspace window.
# or search in the browser and click on the file in the Files window

## ####
## 3
## ####

titanic <- read.table("files/Titanic.txt", header=TRUE, sep=",")
# or:
titanic <- read.csv("files/Titanic.txt")

# NB: this dataset was saved from  dataset Titanic in the dataset package,
# just in case you want to have a look at the help page

# alternatively, you can use 'Import Dataset' in the Workspace window.

## ####
## 4
## ####

library(foreign)

filepath <- "files/airquality.dta"
airquality <- read.dta(filepath)

# alternatively, you can use 'Import Dataset' in the Workspace window.

################################################################################
# SECTIONS 4-5

## ####
## 5
## ####

#help(swiss)
# 6 variables

#View(airquality)

## ####
## 6
## ####

str(titanic)
# 1 numeric variable

head(airquality, 5)

summary(swiss$Fertility)
summary(births)

## ####
## 7
## ####

write.table(swiss, "files/swiss.txt", sep=",")
# or:
write.csv(swiss, "files/swiss.csv")

write.dta(swiss, "files/swiss.dta")

save(swiss, file="files/swiss.RData")
saveRDS(swiss, file="files/swiss.RDS")
