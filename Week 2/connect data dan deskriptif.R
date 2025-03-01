getwd()
setwd("C:/Users/dhihr/OneDrive - London School of Hygiene and Tropical Medicine/R PHLC/pertemuan 1")
#data txt

ddata<-read.table("data1.txt")
View(ddata)
ddata<-read.table("data1.txt",header=TRUE)
View(ddata)

#data csv
dcustomer<-read.csv("customer.csv")


View(dcustomer)

#data xlsx
#install.packages('readxl')
library(readxl)
dcustomer2<-read_xlsx("customer.xlsx")
View(dcustomer2)


str(dcustomer)
dcustomer[,4]
dcustomer[,"gender"]
dcustomer$gender
dcustomer[,2:4]
dcustomer[,c(2,3,5)]
dcustomer[,c("degree_level","family_size","age_cat")]
indeks<-c(2,3,5)
dcustomer[,indeks]
dcustomer[1,]
dcustomer[1:3,]
indeks<-c(2,3,5)
dcustomer[indeks,]
dcustomer[1,2]
dcustomer[,-4]
dcustomer[-1,]




library(RMySQL)
#connect to database
mydb <- dbConnect(MySQL(),
                  user="guest", password="guest",
                  dbname="shinydemo", 
                  host="shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com") ## if db is hosted locally else enter your server address instead of localhost
#port = 3306)  ## Check your port for MySQL

#show tabel on database
dbListTables(mydb)

#show colnames tabel on database. Table Example : "Klasifikasitesting"
dbListFields(mydb, 'City')
dbListFields(mydb, 'Country')
dbListFields(mydb, 'CountryLanguage')

#mengambil table
mydata <- dbReadTable(mydb,"City")
mydata1 <- dbReadTable(mydb,"Country")
mydata2 <- dbReadTable(mydb,"CountryLanguage")

#mengambil beberapa row
mydata4 <- dbGetQuery(mydb,"SELECT * FROM Country LIMIT 100")

dtx=dbGetQuery(mydb, "SELECT Continent, Region FROM Country LIMIT 50")
dtx2=tbl(mydb, sql("SELECT ID, Name , Population FROM City"))

#close connection
dbDisconnect(mydb)







####Deskriptif####

dcustomer<-read.csv("customer.csv")
View(dcustomer)

summary(dcustomer)

#install.packages('psych')
library(psych)
salary=dcustomer$salary
psych::describe(salary)

data39=dcustomer[,c(3,9)]
head(data39)
psych::describe(data39)


gender=dcustomer$gender

table(gender)
table(dcustomer$degree_level)
tabelku=table(gender)
tabelku
prop.table(tabelku)
prop.table(table(dcustomer$gender))

status=dcustomer$marital_status

tabelku2=table(gender,status)
tabelku2

prop.table(tabelku2)
prop.table(tabelku2,1)
prop.table(tabelku2,2)

gender=dcustomer$gender
status=dcustomer$marital_status
salary=dcustomer$salary
aggregate(x=salary,by=list(gender),FUN=mean)
aggregate(x=salary,by=list(gender),FUN=sd)
aggregate(x=salary,by=list(gender),FUN=sum)
aggregate(x=salary,by=list(gender,status),FUN=mean)


#save File
sink('abc.txt')
summary(dcustomer)
sink()

library(psych)

save(dcustomer,file='dcustomer.Rdata')
load('dcustomer.Rdata')
write.csv(dcustomer, "dcustomer2.csv")
