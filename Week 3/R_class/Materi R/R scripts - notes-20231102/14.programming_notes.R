################################################################################
# PROGRAMMING WITH R
################################################################################

################################################################################
# PROGRAMMING VS COMPUTING IN R

# programming: writing a set of instructions for specific tasks
# programming vs computing in R

################################################################################
# PROGRAMMING WITH MATRIX ALGEBRA

# install the package Epi
#install.packages("Epi")

# load the package Epi and dataframe births
library(Epi)
data(births)

# example: performing a linear regression manually

# fit the regression model
lmobj <- lm(bweight ~ matage + hyp, data=births) 

# extract the estimates
summary(lmobj)$coef

# create the model matrix and model response
y <- births$bweight
X <- cbind(int=1, matage=births$matage, hyp=births$hyp)
head(X, 3)

# compare with standard functions
mf <- model.frame(lmobj)
head(mf, 3)
head(model.response(mf), 3)
head(model.matrix(lmobj), 3)

# fit the model manually
(beta <- drop(solve(t(X)%*%X) %*% t(X)%*%y))
coef(lmobj)
summary(lmobj)$coefficients

# example: performing a test

# compute the (co)variance error matrix
(df <- nrow(X)-3)
(sig2 <- sum((births$bweight - X%*%beta)^2) / df)
(V <- sig2 * solve(t(X)%*%X))

# compare with standard functions
summary(lmobj)$sigma^2
vcov(lmobj)

# extract the standard errors
(stderr <- sqrt(diag(V)))

# extract the t statistics and p-values
(tstat <- abs(beta / stderr))
(pval <- pt(tstat, df, lower=F)*2)

################################################################################
# LOOPS AND CONDITIONAL EXPRESSIONS

# control statement (control-flow constructs)

# loops: 'for' construct as for(var in seq) exprs

# an example of a for loop
for(i in 1:3) {
  i2 <- i^2
  print(i2)
}

# in one line without {}
for(i in 1:3) print(i^2)

# conditional expressions: 'if' construct as if(cond) exprs1 else exprs2

# an example of if statement
x <- y <- -2
if(x<0) y <- 3
y

# together with else
(y <- if(x<0) 3 else -2)

# for multiple expressions, use {}
if(x>0) {
  y <- 4
  z <- 1
} else {
  y <- 5
  z <- 3
}
y ; z

# while and repeat constructs for loops

# an example of while
x <- 2
while(x<20) x <- x^2
x

# an example with repeat/break (or next)
x <- 2
repeat {
  if(x>=20) break
  x <- x^2
}
x

# risk of endless loops with while and repeat

# loops often avoided in R by resorting in vectorised computatations

# ifelse: vectorized if
ifelse(test=c(1,4,-2,4,-1) > 0, "pos", "non-pos")

#########################################
## Exercises
#########################################

################################################################################
# CREATING FUNCTIONS IN R

# creating new functions: a key programming task

# the constructor function, header, body, return
somefun <- function(arg1, arg2, arg3) {
  expr1
  expr2
  expr3
  ...
  return(value)
}

# creating a simple function
mymean <- function(x) sum(x) / length(x)

# apply the new function
numvec1 <- c(2,-6, 4, 8, -1)
mymean(numvec1)

# however, in the presence of missing
numvec2 <- c(3,-5, NA, -2, -9, 6, NA)
mymean(numvec2)
x <- numvec2

# additional arguments
mymean2 <- function(x, na.rm=FALSE) {
  if(na.rm) x <- x[!is.na(x)]
  mean <- sum(x) / length(x)
  return(mean)
}

# try now
mymean2(numvec2)
mymean2(numvec2, na.rm=TRUE)

################################################################################
# FUNCTIONAL ASPECTS AND SCOPING RULES

# functional aspects: freedom from side effects and from external influences

# an example of freedom from side effects
x <- 1
f1 <- function(y) {
  x <- 2
  return(y+x)
}
f1(1)
x

# exceptions: super-assignment operator '<<-' and assign()

# an example of freedom from external influences (self-contained)
f2 <- function(y) x + y
f2(1)
x <- 2
f2(1)

# issue: results depend on external obj

# scoping rules: local function environment and search path

#########################################
## Exercises
#########################################
