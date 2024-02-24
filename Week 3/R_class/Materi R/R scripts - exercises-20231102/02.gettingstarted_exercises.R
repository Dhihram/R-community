################################################################################
# GETTING STARTED WITH R - EXERCISES
################################################################################

################################################################################
# SECTIONS 1-3

## ####
## 1
## ####

# play with RStudio

## ####
## 2
## ####

# type:
5 + 3/4
4^2
log(-8)
# a warning is returned
sqrt(10) + 6
# or:
sqrt(10+6)
(sin(4) + 10) / (exp(1.4) + (log(2) * 2))

## ####
## 3
## ####

z <- (sin(4) + 10) / (exp(1.4) + (log(2) * 2))

## ####
## 4
## ####

"Antonio"
(name <- "Antonio")

## ####
## 5
## ####

(name <- "Antonio Gasparrini")

## ## ####
## ## 6
## ## ####
## 
## z + name
## # an error is returned

## ####
## 7
## ####

w <- z^2

## ####
## 8
## ####

rnorm(n=7, mean=5, sd=0.1)

# or:
rnorm(7, 5, 0.1)

## ####
## 9
## ####

rnorm(0.1, 5, 7)
rnorm(sd=0.1, mean=5, n=7)
# yes, it does work provided the arguments are named

################################################################################
# SECTIONS 4-5

## ####
## 10
## ####

getwd()
# the same info is displayed at the top of the Console Window

## ## ####
## ## 11
## ## ####
## 
## setwd("H:/Rcourse")
## # or:
## setwd("H:\\Rcourse")
## 
## # alternatively, the working directory can be set with 'Set Working Directory'
## # in the Session menu

## ####
## 12
## ####

ls()
# or:
objects()

## ## ####
## ## 13
## ## ####
## 
## source("files/testscript.R")
## 
## # or, even simpler, open it in the Editor window and press the button 'Source'
## 
## ls()

## ## ####
## ## 14
## ## ####
## 
## save.image("myfirstsession.RData")
## 
## # alternatively, you can use the menu 'Save' in the Workspace window
## # remember to add the .RData extension

## ####
## 15
## ####

rm(list=ls())

# alternatively, you can use the button 'Clear All' in the Workspace window

## ## ####
## ## 16
## ## ####
## 
## load("files/anothersession.RData")
## 
## # be aware that objects present in the global environment, with the same name
## # as objects in the loaded workspace will be erased
## 
## # or, even simpler, load the file by searching for and
## # clicking on it in the Files window
## 
## ls()

## ####
## 17
## ####

# open a script and save it using the button in the Source window

## ####
## 18
## ####

# copy some commands from history in the script and run them

## ####
## 19
## ####

library(survival)
# as you can see, the package survival depends on the package splines,
# which is also loaded into the session

# alternatively, you can load the package by ticking on it in the list
# provided in the Package window, and also unload it.

## ## ####
## ## 20
## ## ####
## 
## install.packages("metafor")
## # note he folder location where the package is installed in
## 
## # alternatively, you can use the button 'Install Packages' in the Package window
## 
## library(metafor)

## ####
## 21
## ####

search()
# note the package metafor in the search path
