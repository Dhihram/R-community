library(dplyr)
library(Epi)
data(esoph)
esoph

#1
for(i in 1:3) esoph[,i] <- factor(esoph[,i], order=FALSE)
str(esoph)

for(var in c('agegp','alcgp','tobgp')) esoph[[var]] <- factor(esoph[[var]], order=FALSE)
str(esoph)

#2
ind <- sapply(esoph, is.ordered)
esoph[ind] <- lapply(esoph[ind], factor, ordered=FALSE)
str(esoph)

#3
data(births)
repeat {
  if(births$lowbw[i]==1) {
    print(i)
    break
  }
}

for (i in seq(nrow(births))) {
  if(births$lowbw[i]==1) {
    print(i)
    break
  }
}

#4
which(births$lowbw == 1) [1]

min(which(births$lowbw==1))


#5
mytest <-function(x,mu){
  ttest <- (mean(x)-mu)/(sd(x)/sqrt(length(x)))
  pvalue <- 2*(1-pt(abs(ttest),length(x)-1))
  print(c(ttest,pvalue))
  }
mytest(births$bweight,1)

mytest <-function(x,mu){
  ttest <- (mean(x)-mu)/(sd(x)/sqrt(length(x)))
  pvalue <- 2*(pt(z, (length(x)-1), lower.tail = FALSE))
  print(c(ttest,pvalue))
  }
mytest(births$bweight,1)

#6
data(births)
births
mytest(births$bweight,3000)
t.test(births$bweight,mu=3000)

#7
mytest2 <-function(x,mu,na.rm=FALSE){
  if(na.rm) x <- x[!is.na(x)]
  ttest <- (mean(x)-mu)/(sd(x)/sqrt(length(x)))
  pvalue <- pt(z, (length(x)-1), lower.tail = FALSE)
  print(c(ttest,pvalue))
}

mytest2 <-function(x,mu,na.rm=FALSE){
  if(na.rm) x <- x[!is.na(x)]
  meanx <- mean(x)
  sdx <- sd(x)
  sqrtl <- sqrt(length(x))
  ttest <- (meanx-mu)/(sdx/sqrtl)
  pvalue <- pt(z, (length(x)-1), lower.tail = FALSE)
  print(c(ttest,pvalue))
}
#8
mytest2(births$gestwks,38.5,TRUE)
t.test(births$gestwks,mu=38.5)

#9
res<- rep(NA,10000)

for(i in seq(res)) {
  sample <- rnorm(10)
  res[i] <- mytest(sample,mu=0)
}
mean(res < 0.05)
}

res <- sapply(seq(10000), function(i) mytest(rnorm(10), mu=0))
mean(res < 0.05)
