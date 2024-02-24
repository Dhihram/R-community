################################################################################
# MORE ON R OBJECTS
################################################################################

################################################################################
# FACTORS

# objects as data structures
# assembled from vectors, the basic block of R data structures

# a factor: vector of categorical data

# creating a factor from a character vector
sex <- c("Male","Female","Female","Male","Male")
fsex <- factor(sex)

# print the two objects
sex
fsex

# levels
# similar to character vector with strings, but unquoted

# mode of factor
mode(fsex)

# original vector converted in numeric vector with labels
# levels assigned automatically to unique categories in alphabetical order

# inspect the categories (levels)
levels(fsex)

# change the reference category
fsex2 <- relevel(fsex, ref="Male")
fsex2

# coded data is sometimes provided
# if 2=Yellow, 5=Red and 8=Green
(fcol <- factor(c(8,2,5,5,2,8,2), labels=c("Yellow","Red","Green")))

# ordered factors: categories with implicit increasing order
factor(c(2,3,1,3,2), labels=c("low","medium","high"), ordered=TRUE)

################################################################################
# MATRICES AND ARRAYS

# a very important object: the matrix
# a rectangular array of elements with the same mode

# create a matrix
mymat1 <- matrix(1:6, nrow=2, ncol=3)
mymat1

# one dimension is enough
(mymat2 <- matrix(c(2,0,3,1), nrow=2))

# also note printing: square brackets representing indices

# by default, filled by columns
# if by rows:
matrix(1:6, nrow=2, ncol=3, byrow=TRUE)

# matrix dimensions
nrow(mymat1)
ncol(mymat1)
dim(mymat1)

# length of the matrix
length(mymat1)

# technically, a matrix is a vector with info on dimensions
# treated like a vector in many computations
# R provides flexible computational facilities for matrices

# binding matrices
cbind(mymat1, mymat2)

## # if dimensions are not consistent:
## rbind(mymat1, mymat2)

# elementary computations with matrices work element by element
mymat3 <- matrix(4:1, 2)
mymat2 + mymat3
mymat2 > mymat3

# matrix multiplication
mymat2 %*% mymat1

# other matrix computations (see related pages):
t(mymat2)
solve(mymat2)

# the function diag(): returned value depends by argument
diag(mymat2)
diag(1:3)
diag(2)

# mean and sum by columns/rows
colSums(mymat1)
colMeans(mymat1)

rowSums(mymat1)
rowMeans(mymat1)

# array
array(1:8, dim=c(2,2,2))

# not the additional dimension of 'layers'

#########################################
## Exercises
#########################################

################################################################################
# LISTS

# a list: collection of objects, optionally of different modes
mylist1 <- list(1:5, fsex, mymat2)
mylist1

# elements of the list called 'components'
# single and double square brackets

# mode and length of a list
mode(mylist1)
length(mylist1)

# list: most flexible objects in R
# similar to vectors, but elements can be more structured objects

# concatenate as with vectors
c(mylist1,mylist1)

# tagged arguments for named lists
mylist2 <- list(numbers=1:3, names=c("Roger","Nick","Richard","Syd","David"))
mylist2

# the dollar operator for named lists
# the component names of the list mylist2
mylist2$names

################################################################################
# DATA FRAMES

# data frame: object resembling a dataset with records and variables
bands <- data.frame(name=c("The Cure","dEUS","Pearl Jam","Pink Floyd"),
  year=c(1976,1991,1990,1965), country=c("UK","Belgium","USA","UK"))
bands

# similar to matrices: rectangular, defined number of rows and columns
# similar to list: variables of different modes

# essentially, dataframes are lists
mode(bands)
length(bands)

# dollar operator
bands$country

# however, they can also be treated as matrices
nrow(bands)
ncol(bands)

################################################################################
# ATTRIBUTES AND OBJECT TYPES

# attributes (intrinsic and non-intrinsic)
attributes(mymat2)

# extract an attribute
attr(mymat2, "dim")

# names stored as attributes
attributes(mylist2)

# coercion
as.data.frame(mymat2)

# coerce factors
as.character(fsex)
as.numeric(fcol)

# note how the numbers in fcol are different than originally inputted}

#########################################
## Exercises
#########################################
