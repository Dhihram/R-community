####Data Frame####
kategori=c("rendah","rendah","rendah","sedang","sedang","sedang","tinggi","tinggi")

nilai=c(30,45,50,65,75,83,90,95)

gender=c('L','P','P','L','L','L','P','L')

df<-data.frame(kategori,nilai,gender)
str(df)

ukuran <- gl(2, 2, 24, labels = c("lebar", "sempit"))

permukaan <- gl(3, 8, labels = c("keras","sedang","lembut"))

kekuatan<-round(abs(rnorm(24,mean=80,sd=5)))


df2<-data.frame(ukuran,permukaan,kekuatan)


#menggabungkan vektor kedalam dataframe menggunakan cbind

df3<-data.frame(nilai,kategori)

kelompok <- c(1,2)
df33 <- cbind(kelompok,df3)

kelompok <- rep(c(1,2),times=4)
df3$kelas <- kelompok


#mengubah matrix menjadi dataframe
m2<-matrix(c(1,3,2,5,-1,2,2,3,9),ncol=3,byrow=T)

df4<-as.data.frame(m2)


##mengambil element dataframe
df
df[2,]
df[,2]
df[,'nilai']
df$gender

df[c(1,3,5),2]
df[c(1,3,5),]
df[,1]

df$kategori[1:5]

df$kategori=='rendah'

df[df$kategori=='rendah',]

df[df$kategori=='sedang'|df$nilai>50,]
df[df$kategori=='sedang'& df$nilai>50,]

df[which.max(df$nilai),]

df[df$nilai==max(df$nilai),]


##sort dan filter menggunakan subset
mobil<-mtcars
head(mobil,4)
tail(mobil,3)

mobilsort<-mobil[order(mobil$hp,decreasing = T),]


head(mobilsort)

subset(mobil, cyl == 6 & hp > 110)
subset(mobil, cyl %in% c(6,8) & hp > 110, select = c(mpg, cyl, hp,disp))
subset(mobil, carb < 4 | cyl < 6)


#mengecek dataframe
df
str(df)
summary(df)
View(df)
nrow(df)
ncol(df)
names(df)

####matrix####

matrix(1:20,nrow=5,ncol = 4,)

matrix(1:20,nrow=5,ncol = 4,byrow= TRUE)

matriks1<-matrix(c(10,20,30,40,50,60),ncol=2)

mydata <- c(2.9, 3.4, 3.4, 3.7, 3.7, 2.8, 2.8, 2.5, 2.4, 2.4)
length(mydata)
dim(mydata)

dim(mydata)<-c(5,2)
mydata


##Menggabungkan vektor menjadi matrix
v1<-rep(1:3,1:3)

v2<-c(10,20,30,40,50,20)

v3<-rnorm(6)

matriks3<-cbind(v1,v2,v3)


matriks4<-rbind(vektor1=v1,vektor2=v2,normal=round(v3,2))


(matriks5 <- cbind(1, 1:4))

(matriks6 <- rbind(cbind(1, 1:4),cbind(2,c(2,3,4,5))))


##mengambil element matriks
#X[baris,kolom]
#matriks6[,2]

matriks3
matriks3[2,3]                  #elemen dari matriks3 pada baris 2, kolom 3
matriks3[2,]                   #baris 2
matriks3[,3]                   #kolom 3
matriks3[-1,]                  #submatriks dari matriks3 tanpa baris pertama
matriks3[,-1]                  #submatriks dari matriks3 tanpa kolom pertama
matriks3[-1,-1]                #submatriks dari matriks3 tanpa kolom pertama dan baris pertama
matriks3[matriks3[,1]==3,]


matriks3[matriks3[,1]==3,]
matriks3[matriks3[,1]<=2,]

matriks3[which(matriks3==3)]

#Operasi Matriks
2*matriks3                       #perkalian skalar
v1+matriks3                      #penambahan matriks addition
t(matriks3)                      #transpos dari matriks3
(matriks7<-matriks4 %*% matriks3)#perkalian komponen matriks
solve(matriks7)                 #invers matriks
det(matriks7)
mean(matriks3[,3])
var(matriks3[2,])
rowSums(matriks3)
colSums(matriks3)
rowMeans(matriks3)
colMeans(matriks3)
summary(matriks3)

X <- rbind(matriks3,colMeans(matriks3))
X <- cbind(X,rowSums(X))
X

colnames(X)[4] <- "Penjumlahan"
rownames(X)    <- c(paste0('baris',1:6),"Rata2")
X[7,4]<-NA

#Macam-macam matriks
matrix(nrow=3,ncol = 3)
matrix(1,nrow=3,ncol = 3)
diag(3)                  #membangun k by k identity matrix
diag(4)
diag(2,3,4)
diag(c(2,3,3))           #diagonal matriks
diag(c(2,3,4),3,4)
m2<-diag(c(2,3,3)) 
