################################################################################
# FUNCTIONS AND PROGRAMMING PARADIGM OF R
################################################################################

################################################################################
# FUNCTION OBJECTS

# The paradigm of functional programming
# Everything is an object, also functions

# a function object
rnorm
mode(rnorm)

# everything in R is produced through functions
# simple computations through operators seem an exception, but:
'+'(3, 2/3)

# Functions produce new objects, then to be used in other functions
# Analysis as a series of function evaluation, with results as side effects

################################################################################
# FUNCTION CALL AND EVALUATION

# function call and evaluation: rough description
# argument matching, call evaluation, computation, assignment or return
z <- 3
obs <- rnorm(mean=z, 5)

# function calls as arguments of other functions: extreme flexibility
mean(rnorm(10))

# the search path
search()

# environments at different positions in the hierarchy
# loaded packages at position 2

################################################################################
# THE CLASS

# the class: a blueprint for objects with a common set of attributes and properties

# an illustrative example: a numeric vector and a factor
myvec <- c(3,1,3,-2,7,1,1)
myfct <- factor(myvec)

# mode
mode(myvec) ; mode(myfct)

# class
class(myvec) ; class(myfct)

# mode refers to elements composing the object
# class is a generic definition: a specific object is an 'instance' of a class
# new classes of objects can be defined in addition to the standard ones

################################################################################
# OBJECT-ORIENTED PROGRAMMING

# object-oriented programming and the role of classes

# use of summary with different classes of objects
summary(myvec)
summary(myfct)

# computation depends on the type of objects used as arguments
# the class defines not only the object but also the computations involving it

# flexible computational setting and simpler syntax
