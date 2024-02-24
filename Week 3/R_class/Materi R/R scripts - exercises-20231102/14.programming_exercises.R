################################################################################
# PROGRAMMING WITH R - EXERCISES
################################################################################

## ####
## 1
## ####

data(esoph)
#help(esoph)
str(esoph)

# simple method (knowing the variable indices)
for(i in 1:3) esoph[,i] <- factor(esoph[,i], order=FALSE)
str(esoph)

# longer but safer
data(esoph)
for(var in c("agegp","alcgp","tobgp")) 
  esoph[[var]] <- factor(esoph[[var]], order=FALSE)
str(esoph)

## ####
## 2
## ####

data(esoph)
#help(esoph)
str(esoph)

# using the apply family
ind <- sapply(esoph, is.ordered)
esoph[ind] <- lapply(esoph[ind], factor, ordered=F)
str(esoph)

## ####
## 3
## ####

library(Epi)
data(births)
#help(births)

# inspect the variable
births$lowbw

# repeat loop
i <- 1
repeat{
  if(births$lowbw[i]==1) {
    print(i)
    break
  }
  i <- i + 1
}

# for loop
for(i in seq(nrow(births))) {
  if(births$lowbw[i]==1) {
    print(i)
    break
  }
}

# while loop
i <- 1
while(births$lowbw[i]==0) i <- i + 1
i

# repeat and while needs assignment
# repeat and loop has longer and more complex coding
# while risks endless loop or error (e.g. no lowbw)

## ####
## 4
## ####

# much easier
which(births$lowbw == 1)[1]

# or
min(which(births$lowbw == 1))


## ####
## 5
## ####

myttest <- function(x, mu) {
  mean <- mean(x)
  sd <- sd(x)
  n <- length(x)
  tstat <- (mean-mu)/(sd/sqrt(n))
  pvalue <- 2*(1-pt(abs(tstat),n-1))
  return(pvalue)
}

## ####
## 6
## ####

library(Epi)
data(births)
summary(births$bweight)

myttest(births$bweight, mu=3000)
t.test(births$bweight, mu=3000)

## ####
## 7
## ####

summary(births$gestwks)
myttest(births$gestwks, mu=38.5)

myttest2 <- function(x, mu) {
  if(any(isna <- is.na(x))) x <- x[!isna]
  mean <- mean(x)
  sd <- sd(x)
  n <- length(x)
  tstat <- (mean-mu)/(sd/sqrt(n))
  pvalue <- 2*(1-pt(abs(tstat),n-1))
  return(c(tstat=tstat, df=n-1, "p-value"=pvalue))
}

myttest2(births$gestwks, mu=38.5)
t.test(births$gestwks, mu=38.5)

## ####
## 8
## ####

myttest2(births$gestwks, mu=38.5)
t.test(births$gestwks, mu=38.5)

## ####
## 9
## ####

res <- rep(NA,10000)

for(i in seq(res)) {
  sample <- rnorm(10)
  res[i] <- myttest(sample,mu=0)
}

mean(res < 0.05)

## ####
## 10
## ####

# without a loop:
res <- sapply(seq(10000),function(i) myttest(rnorm(10),mu=0))
mean(res < 0.05)
