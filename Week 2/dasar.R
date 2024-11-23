####BASIC R####

#variabel
X=5
X
Y<-10
Y

4 -> z
print(z)

#memberikan perintah sekaligus bersamaan bisa menggunakan pemisah  ';'
y1 = 2;y1 

nama <- "Hazan"
umur <- 40
nama
umur

hasil= X+Y*z/y1
hasil

# Multiple variabel dalam 1 baris
var1 <- var2 <- var3 <- "Indonesia"

var1
var2
var3


####Type Data####
#character
"A"
'B'
'C'
"AKU"
'123'
'120F'
"Hai Dunia"
print("dia baik padaku hanya sebagai 'teman' ")

#Numeric
1
12.3
0.21
12e-6   #options("scipen"=0)
123e+10
-5
print(231)

#Integer
10L
-215L
12.3L    #Jika kita mencoba tipe data numerik maka akan keluar warning
print(231L)

#Logical
FALSE
TRUE

#Complex
-3i
2i
9i+3


##aritmatika
#Penjumlahan
5+2
x=5
y=10
z=x+y;z

#Pengurangan
5-2
x=5
y=10
z1=x-y;z1

#Perkalian
5*2
x=5
y=10
z2=x*y;z2

#Pembagian
5/2
x=5
y=10
z3=x/y;z3

#Pangkat
5^2
x=5
y=10
z4=x^y;z4

#modulo
5%%2
x1=15
y=10
z5=x1%%y;z5

#pembagian hasil bulat
5 %/% 2
x1=15
y=10
z6= x1 %/% y
z6

##fungsi matematika dasar
hasil1= abs((5-12)/(y-3))
hasil1
hasil2= x-abs((5-12)/(y-3))
hasil2
hasil3= sqrt((x-x1)^2/(y-1))
hasil3
hasil4=log(100,base=10)
hasil4
hasil5=log(100)
hasil5
hasil6=floor(3.333)
hasil6
hasil7=ceiling(3.333)
hasil7
hasil8=round(3.358,1)
hasil8




##logical
15 == 20     
10 != 5*4    

15 <= 20
15 <  20
15 >= 20
15 >  20

a = 200
b = 33
c = 150

a >= c & b <= c
a >= c & b >= c
a > c | b <= c
a >= c | b >= c
!(a >= c & b >= c)
!(a >= c | b >= c)


####FUNGSI IF####
#sintaks1
nilaites=70

if (nilaites>=65){
  print("Anda LULUS")
}

#sintaks2
nilaites=64

if (nilaites>=65){
  
  print("Anda LULUS")

  } else {
  
  print("Anda belum lulus")
  
  }

#sintaks3
nilaites=64
if (nilaites>=80){
  print("Anda LULUS Dengan nilai Mutu A")
} else if(nilaites<80 & nilaites>=70){
  print("Anda LULUS.  Anda memiliki nilai mutu B")
} else {
  print("Anda tidak LULUS. Anda memiliki nilai mutu C")
}


##While looping
#while1
i <- 1
while (i < 6) {
  print("aku suka kamu")
  i <- i + 1
}

#while2
kekayaan <- 10
while (kekayaan>2){
  print("aku akan selalu ada untukmu")
  kekayaan <- kekayaan - 1
  if (kekayaan == 4){
    break
  }
}


##for looping
#for1
for(i in 1:10){
  x=i*3
  print(x)
}

#for2
for (i in 1:10){
  print(paste("new looping",i))
}

#for3
nilai <- c(40, 50, 70, 80, 90, 100)
nama<-c('hazan','baco','uji','imran','sabil','anto')

for (x in 1:6) {
    print(paste(nama[x],nilai[x]))
}

##function
#fungsi1
pph<- function(honor) {
   y<- honor*(50/100)*(5/100)
   y
}

pph(1000000)

#fungsi2
bertingkat <- function(x, y) {
  a <- sqrt(x^2 + y^2)
  a
}
bertingkat(bertingkat(2,2), bertingkat(3,3))

#fungsi3
pajak <- function(umur,gaji) {
  if (umur<30){
    y<-gaji*2/100
    y
  }else if(umur<40){
    y<-gaji*5/100
    y
  }else if(umur<=56){
    y<-gaji*10/100
    y
  }else{
    y<-gaji*1/100
    y
  }
}

pajak(29,2000000)
pajak(35,4000000)   

