################################################################################
# HANDLING SPECIAL DATA TYPES IN R
################################################################################

################################################################################
# WORKING WITH MISSING DATA

# the interpretation of NA: not available, which is 'undefined'

# load the package Epi and births (uncomment if needs installing)
#install.packages("Epi")
library(Epi)
data(births)

# let's have a look
head(births, 3)

# test for equality with NA
head(births$gestwks) == NA

# instead, use is.na()
is.na(head(births$gestwks))

# exclude missing values through indexing
births$gestwks |> head(4)
births$gestwks[!is.na(births$gestwks)] |> head(4)

# computation with missing: undefined as above
mean(births$gestwks)

# using na.rm
mean(births$gestwks, na.rm=T)

# use of na.omit()
na.omit(births) |> head(4)

# use of complete.cases()
complete.cases(births)

#########################################
## Exercises
#########################################

################################################################################
# COMPUTING WITH STRINGS

# computing with strings: the function paste()
(subvec <- paste("Subject", ".", 0, 1:4, sep=""))

# with the 'collapse' argument
paste("The subjects are:", paste(subvec, collapse=", and "))

# extract part of a string
(namevec <- c("01 Mark","02 Tim","03 Robert"))
substr(namevec, start=4, stop=100)

# string matching
match(1:5, 3:6)
1:5 %in% 3:6

# substitute a specific pattern
gsub(" ", ".", namevec)

# identify a pattern
grep(pattern="a", x=namevec)

# alternatively
grepl(pattern="a", x=namevec)

# other functions
nchar(namevec)
strsplit(namevec, split=" ")

################################################################################
# WORKING WITH MISSING DATA

# the Date objects
as.Date(c("2000-01-01","1945-04-25"))
as.Date(1:5, origin="1992-12-28")

# different formats
as.Date("27/02/94", format="%d/%m/%y")
as.Date("03 July 1233", format="%d %b %Y")

# let's have a look
head(airquality, 3)

# create the date
airquality$date <- paste(1973, airquality$Month, airquality$Day) |> 
  as.Date(format="%Y %m %d")
head(airquality, 3)

# extracting info from dates
(today <- Sys.Date())
format(today, "%a %d %b %Y")
format(today, "%j")

# computing with dates
today + 1000
today - as.Date("1900-01-01")

#########################################
## Exercises
#########################################
