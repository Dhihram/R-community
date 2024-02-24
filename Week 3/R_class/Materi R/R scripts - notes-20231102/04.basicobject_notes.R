################################################################################
# THE BASICS OF R OBJECTS
################################################################################

################################################################################
# DATA IN OBJECTS

# 'everything is an object'
# different types of objects

# the 'mode' of object: the internal structure of its atomic elements
mode(2)
mode("Robert Smith")
mode(FALSE)

# 'type' of an object: the 'storage mode'
typeof(2)

# the 'is' functions
is.numeric(2)
is.integer(5.1)
is.logical("Iggy Pop")

# the 'as' functions: coercion
as.numeric(TRUE) ; as.numeric(FALSE)
as.logical(-3) ; as.logical(0)
as.character(3)

# automatic coercion
3 + TRUE
# not always work: sometimes warnings or errors

################################################################################ 
# VECTORS

# the simplest R object: the vector
# sequence of elements of the same mode
# building block of other more complex objects

# concatenation
(numvec1 <- c(4,2,-7,16,-2))
# elements defined as an arbitrary number of arguments of c()

# longer vector
rnorm(10)

# note the numbers in square brackets

# concatenating vectors
numvec2 <- c(3,0,0,-2,14)
(numvec3 <- c(numvec1,numvec2))

# character vector:
(pj <- c("Eddie","Stone","Jeff","Mike","Matt"))

# logical vector
(logvec <- c(T,T,F,T,F))

# logical vector also created by 'conditions'

# logical and relational operators
numvec2 == -2
pj != "Stone"
numvec1 > 3
! numvec1 >= 2

# the length of a vector
length(numvec1)

# check the workspace

################################################################################ 
# REGULAR SEQUENCES

# the colon operator
3:10

# also:
10:3

# colon operator is a shortcut to the functions seq()
seq(from=1, to=2, by=0.2)
seq(from=3, to=6, length.out=5)
# see role of different arguments

# the function rep()
rep(1:4, 2)

# flexible use
rep(1:3, times=1:3)

# the argument each
rep(1:4, each=2)

# also with different vector types
rep(c("a","b","c"), 2)

#########################################
## Exercises
#########################################

################################################################################ 
# COMPUTING WITH VECTORS

# computing with vectors
numvec1 * numvec2

# vectorization: operations carried out element by element

# relational or logical operators
1:3 == 3:1
c(T,F,T) & c(F,F,T)
numvec1 > 3 | numvec1 < 0

# precedence of operators
3+2^2:10

## # see:
## ?Syntax

# force precendence
(3+2)^2:10

# use of functions
mean(numvec1)
sd(numvec2)

# function returning more complex results
summary(numvec1)

# other functions:
max(numvec1)
range(numvec1)
sum(numvec1)
quantile(numvec1, 1:3*25/100)

# vectorized functions
log(1:5)
abs(-2:2)

# other important functions for vector computations
pj
rev(pj)
sort(pj)

# ordering permutation
numvec1
order(numvec1)

# functions for selecting elements
which(numvec1>0)
which.max(numvec1)

# matching 
match(c("Mike","Stone"), pj)
pj %in% c("Stone","Chris","Layne","Mike")

################################################################################ 
# CONSTANTS AND RESERVED WORDS

# Constants: NA and NULL

# missing value as NA
c(2,NA,4,1)

# meaning of NULL and NA
c(2,NA,3) ; c(2,NULL,3)

# reserved words such as TRUE, FALSE, NA, NULL

## # try:
## TRUE <- 1:3

# built-in constants
pi
letters

#########################################
## Exercises
#########################################
