################################################################################
# LABELLING AND INDEXING IN R - EXERCISES
################################################################################

################################################################################
# SECTIONS 1-2

## ####
## 1
## ####

myvec <- c(a=1, b=7, c=3)

## ####
## 2
## ####

# standard package 'datasets' already installed
data(esoph)
#View(esoph)
#help(esoph)

# variables
# as a list:
names(esoph)
# as a matrix:
colnames(esoph)
# alternative ways:
attributes(esoph)$names
attr(esoph, "names")

# observations:
rownames(esoph)

## ####
## 3
## ####

# install the package Epi from CRAN (if not yet installed) with install.packages
#   or using the menu 'Install Packages' in RStudio
library(Epi)
data(births)
#View(births)
#help(births)

bweight <- births$bweight

## ####
## 4
## ####

bweight[1:10]
head(bweight, 10)

summary(bweight)
quantile(bweight, probs=0.25)
bweight[bweight < 2862]
# all in one command
bweight[bweight < quantile(bweight, probs=0.25)]

################################################################################
# SECTIONS 3-5

## ####
## 5
## ####

mat <- matrix(rnorm(5*8), nrow=5)
dim(mat)
mat

mat[,1]

## ####
## 6
## ####

# amongst other methods:
mat[2:4, 5:8]
mat[2:4, -c(1:4)]
mat[2:4, seq(ncol(mat)) >= 5]

## ####
## 7
## ####

names(esoph)
# amongst other methods:
# indices
esoph[1:10, c(1,5)]
# names
esoph[1:10, c("agegp", "ncontrols")]
# double indexing
esoph[c("agegp", "ncontrols")][1:10,]

## ####
## 8
## ####

# define a condition for selecting the observations
levels(esoph$agegp)
cond <- esoph$agegp %in% c("25-34","35-44","45-54")
# or, more complex but faster:
cond <- as.numeric(esoph$agegp)<=3

esoph[cond, c("ncontrols","tobgp")]
