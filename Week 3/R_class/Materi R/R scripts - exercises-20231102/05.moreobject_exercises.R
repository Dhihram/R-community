################################################################################
# MORE ON R OBJECTS - EXERCISES
################################################################################

################################################################################
# SECTIONS 1-2

## ####
## 1
## ####

vec <- c(1,99,3,3,1,2,99)
f <- factor(vec, labels=c("A","B","C","none"))

f <- relevel(f,ref="none")

# or, directly:
f <- factor(vec, levels=c(99,1:3), labels=c("none","A","B","C"))

## ####
## 2
## ####

mat1 <- matrix(c(2,1,4,3), nrow=2)
mat2 <- matrix(c(2,10,4,12,6,14,8,16), nrow=2)

# or, more efficiently:
mat2 <- matrix(1:8*2, nrow=2, byrow=TRUE)

## ####
## 3
## ####

mat3 <- cbind(mat1,mat2)

dim(mat3)

## ####
## 4
## ####

mat3 == 3

diag(4)

## ####
## 5
## ####

mat4 <- mat1 %*% mat2

rowSums(mat4)
# or, as a matrix:
mat4 %*% rep(1,4)

################################################################################
# SECTIONS 3-5

## ####
## 6
## ####

mylist <- list(vector=vec, matrix=mat1)

## ####
## 7
## ####

data <- data.frame(vec,f)

nrow(data)
ncol(data)
dim(data)

## ####
## 8
## ####

attributes(mylist)

attr(data,"names")
# or:
attributes(data)$names

## ####
## 9
## ####

matf <- as.matrix(f)

matf
mode(matf)
