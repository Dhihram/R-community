####struktur data####
####membuat vector####
#Vektor umumnya dibuat dengan menggunakan fungsi c(), seq(), rep(), paste()

c(1,1,2,3,5,8,13,21)
x1<-c(1,1,2,3,5,8,13,21);x1
x2<-c("A","B","C");x2
x3<-c("three", "blind", "mice");x3

x4<-1:10
x5<-seq(from=0, to=20)
x6<-seq(from=0, to=14, by=0.5)

x7<-rep(2,3)
x8<-rep(1:2,2)
x9<-rep(1:2,times=2)
x10<-rep(1:2,each=2)
x11<-rep(1:2,times=2,each=2)
x12<-rep("pi", times=5)
x13<-c(rep(1,3),rep(2,2))

x14<-paste(1:12)
x15<-paste("A",rep(1:4,each=2))


#Kasus khusus untuk membangkitkan data atau membuat huruf
set.seed(123)
m1<-rnorm(100)

HURUF <- LETTERS[1:5]
huruf <- letters[1:26]


#Manajemen data vector
x1<-c(1,1,2,3,5,8,13,21)
2-x1
2*x1
x1^2
x1*x1
x1%*%t(x1)

length(x1)

x1[1:3]
md <-x1[-(1:3)]
md1<-x1[c(1,4,5)]
md2<-x1[x1>5]
which(x1>5)
x1[which(x1>5)]
x1>=5

#recodedata
#recode1
x15<-c(rep("A",2),rep("b",2),rep("c",3))
xz15<-c()
for(i in 1:length(x15)){
  if(x15[i]=="A"){
    xz15[i]=1
  }else if(x15[i]=="B"){
    xz15[i]=2
  }else {
    xz15[i]=3
  }}

xz15

#recode2
yy=1:10
xyz=c()
for (i in 1:10){
  if(yy[i]<=3){xyz[i]=1}
  else if(yy[i]<=7){xyz[i]=2}
  else{xyz[i]=3}
}
xyz

#missing value
xc=c(1,2,NA,3,5)
xm<-xc[!is.na(xc)]      #menghilangkan na vector
xm

x1[is.na(x1)]=0
x1

####matrix####
matrix(1:20,nrow=5,ncol = 4)

matrix(1:20,nrow=5,ncol = 4,byrow= TRUE)

m1<-matrix(c(10,20,30,40,50,60),ncol=2)

m2<-matrix(c(1,3,2,5,-1,2,2,3,9),ncol=3,byrow=T)

dv<-c(10,20,30,40)
m3<-matrix(dv,2,2)


mydata <- c(2.9, 3.4, 3.4, 3.7, 3.7, 2.8, 2.8, 2.5, 2.4, 2.4)
dim(mydata)<-c(5,2)
colnames(mydata)<- c("K1","K2")
rownames(mydata)<- c("p1","p2","p3","p4","p5")
dim(mydata)<-NULL		#membuat dimensi matriks menjadi vektor



m2[2,3]                  #elemen dari m3 pada baris 2, kolom 3
m2[2,]                   #baris 2
m2[,3]                   #kolom 3
m2[-1,]                  #submatriks dari m3 tanpa baris pertama
m2[,-1]                  #submatriks dari m3 tanpa kolom pertama
m2[-1,-1]                #submatriks dari m3 tanpa kolom pertama dan baris pertama

#Operasi Matriks dalam R

2*m1                     #perkalian skalar
m1+m2                    #penambahan matriks addition
m1 %*% m2                #perkalian komponen matriks
t(m2)                    #transpos dari m2
solve(m2)                #invers matriks
diag(3)                  #membangun k by k identity matrix
diag(c(2,3,3))           #diagonal matriks


class(m2)		#mengetahui class suatu data
dim(m2)			#mengetahui dimensi suatu matrix
nrow(m2)
ncol(m2)


####data frame####
x = c(rep("one",5))
y = c(rep("two",5))
z = c(rep(3,5))
df1=data.frame(x,y)
df2= data.frame(x,y,z)

#mengubah matrix menjadi dataframe
m2<-matrix(c(1,3,2,5,-1,2,2,3,9),ncol=3,byrow=T)
dfm<-as.data.frame(m2)

#mengakses data
df2[,2]
df2[1,]
df2$y
df2[-1,]                  
df2[,-1]                  

#missing value
xc=c(1,2,NA,3,5)
sum(is.na(xc))
df3=data.frame(df2,xc)

df4=na.omit(df3)    #menghilangkan na dataframe

##cara mengganti na dan NAN menjadi 0
df3[is.na(df3)]=0


#memfilter
kategori=c("rendah","rendah","rendah",
           "sedang","sedang","sedang","tinggi","tinggi")
nilai=c(30,45,50,65,75,83,90,95)

dataku=data.frame(kategori,nilai)

baru=subset(dataku,nilai>50)

baru2=subset(dataku,kategori=="rendah")



####LIST####
kumpul1<-list(x1,m2,df2)
kumpul1
kumpul1[3]

kumpul2<-list(x1=x1,m2=m2,df2=df2)
kumpul2$x1
kumpul2$x1[1]
kumpul2$m2[,1]
kumpul2$df2[2,]
kumpul2[-1]
kumpul2$m2[-1,]



