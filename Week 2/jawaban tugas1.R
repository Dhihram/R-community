# jawaban tugas
#1. Buatlah sebuah vektor yang berisi 5 nama personel BTS
BTS <- c('Jungkook', 'Jimin', 'V', 'Suga', 'Jin')
print(BTS)
angka <- seq(1, 100, by = 2)
print(angka)


#2. Bukalah file ‘lowbwt.csv’ dan cek tipe datanya dan cek ringkasan datanya
lowbwt <- read.csv('lowbwt.csv')
str(lowbwt)
summary(lowbwt)

#3. Buatlah operasi matematika dari perkalian 3.25 dari vektor 1,9,5,8,2,6,7 dengan pembulatan 2 angka koma
vec <- c(1,9,5,8,2,6,7)
vec2 <- 3.25*vec
round(vec2, 2)
print(vec2)

#4.  Buatlah data frame 10 baris dengan kolom berisi: nama, tanggal lahir, dan status
nama <- c('Jungkook', 'Jimin', 'V', 'Suga', 'Jin', 'RM', 'J-Hope', 'Jungkook2', 'Jimin2', 'V2')
tanggal_lahir <- c('1997-09-01', '1995-10-13', '1995-12-30', '1993-03-09', '1992-12-04', '1994-09-12', '1994-02-18', '1997-09-01', '1995-10-13', '1995-12-30')
status <- c('single', 'single', 'single', 'single', 'single', 'single', 'single', 'single', 'duda', 'duda')
df <- data.frame(nama, tanggal_lahir, status)
print(df)
