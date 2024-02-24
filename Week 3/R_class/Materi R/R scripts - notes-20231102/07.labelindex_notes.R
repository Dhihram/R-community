################################################################################
# LABELLING AND INDEXING IN R
################################################################################

################################################################################
# LABELLING

# Labelling: assigning names to object elements

# labelling elements of a vector with tags
yearfirstlp <- c(Muse=1999, "Neil Young"=1968, "Stone Roses"=1989)
yearfirstlp

# names saved as attributes, and names() function)
attributes(yearfirstlp)
names(yearfirstlp)

# labelling matrices
mymat <- matrix(1:6, nrow=2, ncol=3, dimnames=list(c("r1","r2"), c("c1","c2","c3")))
mymat

# extract row and column names
rownames(mymat)
colnames(mymat)

# labelling lists
mylist <- list(vector=1:5, matrix=mymat)
mylist

# extract names from a list
names(mylist)

# create a data frame with tags for variables
bands <- data.frame(name=c("The Cure","dEUS","Pearl Jam","Pink Floyd"),
  year=c(1976,1991,1990,1965), country=c("UK","Belgium","USA","UK"))

# extract names using either matrix or list-wise procedures
rownames(bands)
colnames(bands)
names(bands)

# names for observations and variables can assigned or re-assigned as above

################################################################################
# INDEXING VECTORS

# indexing: a key feature of R
# simply a method to select data
# extractor expressions with square brackets []

# index vectors: 4 types

# first type: a sequence of positive indices
numvec <- c(4,2,-7,16,-2)
numvec
numvec[3]
numvec[3:5]

# the same element can be extracted more than once
numvec[rep(3:4, each=3)]

# second type: a sequence of negative indices
numvec[-3]

# remove multiple elements
numvec[-c(1:3)]

## # wrong:
## numvec[-1:3]
## # mixture of positive and negative numbers: not accepted

# third type: a logical vector with the same length
numvec[c(T,T,F,T,F)]

# selecting elements given their values
numvec[numvec>3]

# fourth type: a sequence of element names
yearfirstlp[c("Muse","Stone Roses")]

#########################################
## Exercises
#########################################

################################################################################
# INDEXING MATRICES OR ARRAYS

# indexing matrices or arrays: multiple dimensions, use of comma as in print
mymat[2, c(1,3)]

# selecting all the elements in one dimension: no index
mymat[, -3]

# use of 'drop': coercion to the lowest possible dimension
mymat[2, c(1,3), drop=FALSE]

# same 4 options of index vectors
mymat[c(T,F), c("c1","c3")]

# other methods: matrix treated as a vector (rarely used)
mymat[c(T,F,F,T,F,F)]

# also, an index matrix with logical values
(indexmat1 <- matrix(c(T,T,F,F,F,T), nrow=2))
mymat[indexmat1]

# a matrix of 2 columns with rows defined by pairs of indices (rarely used)
(indexmat2 <- matrix(c(1,2,1,3), nrow=2, byrow=TRUE))
mymat[indexmat2]

# indexing of arrays simply follows

################################################################################
# INDEXING LISTS

# indexing lists: 2 levels

# first level like a vector: result is a list
mylist <- list(numbers=1:3, names=c("Roger","Nick","Richard","Syd","David"))
mylist[2]

# second level: result is the component itself
mylist[[2]]

# same result with the dollar operator
mylist$names

# both levels together: multiple indexing
mylist[[2]][3:4]

################################################################################
# INDEXING DATA FRAMES

# indexing data frames: list-wise
bands[c(1,3)]

# similarly, just a single variable
bands[1]

# alternatively, extract the variable itself
bands[[1]]

# or matrix-wise
bands[,1]

# select rows using matrix-wise indexing
bands[1:2,]

# simultaneously for rows and columns
bands[c(1,3), 2]
bands[1, 1:2]

# link between the indexing criterion and the code
bands[bands$year>1970 & bands$country=="UK", c("name","year")]

# general and flexible computing alternative to specific subsetting functions

#########################################
## Exercises
#########################################
