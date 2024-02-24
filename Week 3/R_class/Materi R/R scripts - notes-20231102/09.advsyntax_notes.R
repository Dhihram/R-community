################################################################################
# ADVANCED SYNTAX AND COMPUTATIONs IN R
################################################################################

################################################################################
# VECTORIZATION AND RECYCLING RULE

# vectorization
# gain in computational speed, compact and clear-cut coding

# create simple vectors
numvec1 <- c(4,2,-7,16,-2)
numvec2 <- c(3,0,0,-2,14)

# apply operators in a vectorized form
numvec1 * 2
numvec2 > 0

# vectorized and non-vectorized functions
max(numvec1, numvec2)
pmax(numvec1, numvec2)

# the recycling rule
rep(3,8) * 1:2

# in earlier examples scalar is recycled

# examples: a matrix
matrix(numvec1, nrow=3, ncol=length(numvec1), byrow=TRUE)

# a data frame
data.frame(id=1:4, level=c(2,1,6,4), country="UK")

# powerful method: extract the odd numbers
(11:20)[c(T,F)]

# however, should be used with caution: warnings
#numvec1 * 1:3

################################################################################
# REPLACEMENT EXPRESSIONS

# assignments and rm() only allow creating/replacing/erasing objects, not changing
# replacement expressions
# assignments in which the left side of the expression is a call to a function

# an example of replacement expression
numvec1
numvec1[numvec1 < 0] <- 0
numvec1

# left-hand side of replacement expression selects part of an object

# create a simple list
mylist <- list(vec1=numvec1, vec2=numvec2)

# replacement expression to add a component to a list
mymat <- matrix(c(3,1,7,4,2,2,5,1), nrow=2)
mylist$mat <- mymat

# check
names(mylist)

# removing part of an object by assignment to NULL
mylist$vec1 <- NULL
names(mylist)

# flexible and powerful computational method
# use of internal replacement functions

################################################################################
# PIPES

# a complex set of nested operations
mean(log(runif(8, 0, 10)))

# complex computations in compact code
# however, drawbacks: complex syntax and inverse direction outer/inner to last/first

# complex computations in compact code
# however, drawbacks: complex syntax and inverse direction outer/inner to last/first
# an alternative is to use intermediate objects, however not ideal

# the pipe operator |>
# an alternative operator %>% is available in other packages

# the use of pipes
runif(8, 0, 10) |> log() |> mean()

# the pipe operator works as a syntax transformation
quote(runif(8, 0, 10) |> log() |> mean())

# passing other arguments
mtcars |> head(3)

# the placeholder _
3 |> head(mtcars, n=_)

# otherwise, use named arguments to assign to the first available
3 |> head(x=mtcars)

# chain of operations involving extraction using the placeholder
mtcars |> head(3) |> _$mpg |> mean()

################################################################################
# THE APPLY FAMILY

# the apply family: the function apply()

# an example
mymat
apply(mymat, MARGIN=1, FUN=sd)
apply(mymat, MARGIN=2, FUN=sd)

# the ellipsis: a way to pass arguments to functions used internally

# an example with apply
apply(mymat, 1, quantile, probs=0.25)

# apply functions for lists
lapply(mylist, length)
sapply(mylist, length)

# example of tapply
tapply(esoph$ncontrols, INDEX=esoph$agegp, FUN=sum)
