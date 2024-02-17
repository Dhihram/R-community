# Handle Jenis dan Tipe Variabel

## MISSING VALUE


# load the package Epi and births (uncomment if needs installing)
#install.packages("Epi")
library(Epi)
data(births)
summary(births)

head(births, 3)

# menggunakan is.na()
is.na(head(births$gestwks))

# mengeluarkan missing value dengan indexing
births$gestwks |> head(4)
births$gestwks[!is.na(births$gestwks)] |> head(4)

# menghitung dengan missing
mean(births$gestwks)

# ignore missing dengan na.rm
mean(births$gestwks, na.rm=T)

# menggunakan na.omit()
na.omit(births) |> head(4)

# use of complete.cases()
complete.cases(births)

#menggunakan mice dengan multiple imputation
births$preterm <- factor(births$preterm, labels=c("no","yes"))
#install package mice
library(mice)
ini <- mice(births, maxit = 0)
meth <- ini$meth
meth
pred <- ini$pred
pred
pred[, "id"] <- 0
pred[, "bweight"] <- 0
pred[, "lowbw"] <- 0
pred[, "matage"] <- 0
pred[, "hyp"] <- 0
pred[, "sex"] <- 0
pred
imp1 <- mice(births, meth = meth, pred = pred, print = FALSE)
summary(complete(imp1))


## STRINGS

# menggunakan paste()
(subvec <- paste("Subject", ".", 0, 1:4, sep=""))

# menggunakan collapse argument
paste("The subjects are:", paste(subvec, collapse=", and "))

# extract bagian dari string
(namevec <- c("01 Mark","02 Tim","03 Robert"))
substr(namevec, start=4, stop=100)

# string matching
match(1:5, 3:6)
1:5 %in% 3:6

# subsitusi spesifik pattern/pola
gsub(" ", ".", namevec)

# identifikasi pola
grep(pattern="a", x=namevec)

# fungsi lain
nchar(namevec)
strsplit(namevec, split=" ")

# Menggunakan tanggal/date

# objek date
as.Date(c("2000-01-01","1945-04-25"))
as.Date(1:5, origin="1992-12-28")

# format
as.Date("27/02/94", format="%d/%m/%y")
as.Date("03 July 1233", format="%d %b %Y")

data(airquality)
head(airquality, 3)

# membuat date
airquality$date <- paste(1973, airquality$Month, airquality$Day) |> 
  as.Date(format="%Y %m %d")
head(airquality, 3)

# menarik info dari dates
(today <- Sys.Date())
format(today, "%a %d %b %Y")
format(today, "%j")

# menghitung dengan date
today + 1000
today - as.Date("1900-01-01")

