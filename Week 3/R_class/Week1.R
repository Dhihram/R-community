# Operasi Matematika
## Tipe data
# JUDUL
## Subjudul
### SUb-Sub judul
1 + 1 # penambahan
8 - 3 # penambahan dan pengurangan
9 / 3
5 * 5

# tipe data numeric, string
"Mirza ganteng" # string harus ditemenin tanda petik

# Variabel
penambahan = 1 + 1
# assignment operator
pengurangan <- 8 - 3
pembagian <- 9/3
perkalian <- 5*5

# naming variabel
## Valid
#### diawali dengan huruf (kecil atau besar)
songdata
sonGdata
song_data
song.data
song_data_trial_1_group_1
SGIE <- "State of Global Islamic Economy"

# invalid
_songdta
1songdata
.1songdada
song data


# buatlah 4 variabel berisi
# tahun ini
# tahun kelahiranmu (fake)
# usia

# Jawaban 1
tahun_ini <- 2024
tahun_kelahiran <- 2001
usia <- tahun_ini - tahun_kelahiran

apel <- 12
jeruk <- 35

# Jawaban 2
tahunini <- 2022 + 2
bday <- 2024 - 31
umur <- tahunini - bday

# function
rnorm(1000, 4.75, 2)


################ Session 2

my_numeric <- "42"
my_character <- "universe"
my_logical <- TRUE

5 + 5
5 + "five"

class(my_numeric)
class(my_character)
class(my_logical)

df <- rnorm(100, 30.75, 1)
df

as.character(my_numeric) # mengubah tipe data
class(my_numeric)

class(df)


friend_ages <- c(27, 25, 29, 26)
friend_dogs <- c("molly", "blacky", "kirik", "anjing")

class(friend_ages)
class(friend_dogs)

mean(friend_ages) # 26.75
max(friend_ages) # 29
min(friend_ages) # 25

# import data excel/ csv to R
library(tidyverse)


#########################################################
#########################################################
#########################################################
### Vektor dengan nama-nama personel BTS
personel_BTS <- c("RM", "Jin", "SUGA", "j-hope", "Jimin", "V", "Jungkook")

### Vektor dengan deret 1-100 dengan interval 2
deret <- seq(1, 100, by = 2)

### Membuka file 'lowbwt.csv'
data_lowbwt <- read.csv("lowbwt.csv")
str(data_lowbwt) # Memeriksa tipe data
summary(data_lowbwt) # Memeriksa ringkasan data

### Membuat vektor
vektor <- c(1, 9, 5, 8, 2, 6, 7)
hasil <- vektor * 3.25 # Mengalikan vektor dengan 3.25
hasil_bulat <- round(hasil, 2) # Membulatkan hasil hingga dua angka di belakang koma
print(hasil_bulat) # Menampilkan hasil

### Membuat data frame
df <- data.frame(
  nama = c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J"),
  tanggal_lahir = as.Date(c("1990-01-01", "1991-02-02", "1992-03-03", "1993-04-04", "1994-05-05", 
                            "1995-06-06", "1996-07-07", "1997-08-08", "1998-09-09", "1999-10-10")),
  status = c("Aktif", "Nonaktif", "Aktif", "Nonaktif", "Aktif", "Aktif", "Nonaktif", "Aktif", "Nonaktif", "Aktif")
)

### Menampilkan data frame
print(df)


#################################
#### Data Visualisation

library(ggplot2)
# libraries needed for these graphs
library(tidyverse)
library(patchwork) 
library(plotly)
library(ggwordcloud)
library(reprores)

set.seed(30250) # makes sure random numbers are reproducible

pets <- read.csv("pets.csv")
plot(x = pets$pet, y = pets$score)

# Step 3: Create Data
x <- 1:10  # A simple vector from 1 to 10 for the x-axis
y <- x^2   # Squares of x for the y-axis values

# Step 4: Plot Data
plot(x, y, type = 'p',    # 'p' for points, other options include 'l' for lines, 'b' for both, etc.
     main = "Example Plot",  # Title of the plot
     xlab = "X Axis",     # Label for the x-axis
     ylab = "Y Axis",     # Label for the y-axis
     col = "blue")        # Color of the points


# Simulate sales data for different stores
set.seed(123) # For reproducible results
store <- factor(rep(c("Store A", "Store B", "Store C"), each = 10)) # Categorical variable
sales <- rnorm(30, mean = 100, sd = 20) # Continuous variable, simulating sales amounts

# Viewings the first few rows of the data
head(data.frame(store, sales))

# Calculate mean sales by store
mean_sales <- tapply(sales, store, mean)

# Viewing the mean sales
mean_sales

# Creating a bar plot of mean sales by store
barplot(mean_sales,
        main = "Average Sales by Store",
        xlab = "Store",
        ylab = "Average Sales",
        col = "skyblue",
        border = "black")

plot(x = pets$pet, y = pets$score)
plot(x = pets$age, y = pets$weight)
hist(pets$score, breaks = 20)

# Bar Plot
ggplot(pets, aes(pet)) +
  geom_bar()

ggplot(pets, aes(score)) +
  geom_density()

ggplot(pets, aes(age, fill = pet)) +
  geom_density(alpha = 0.5)

ggplot(pets, aes(score, color = pet)) +
  geom_freqpoly(binwidth = 5)
##########

ggplot(pets, aes(score)) +
  geom_histogram(binwidth = 5, fill = "white", color = "black")

ggplot(pets, aes(score)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "red")

ggplot(pets, aes(score, fill=pet)) +
  geom_histogram(binwidth = 5, alpha = 0.5, 
                 position = "dodge")


ggplot(pets, aes(pet, score, fill=pet)) +
  stat_summary(fun = mean, geom = "col", alpha = 0.5) + 
  stat_summary(fun.data = mean_se, geom = "errorbar",
               width = 0.25) +
  coord_cartesian(ylim = c(80, 120))


ggplot(pets, aes(pet, score, fill = pet )) +
  stat_summary()

ggplot(pets, aes(pet, score, fill=pet)) +
  geom_violin(draw_quantiles = .5,
              trim = FALSE, alpha = 0.5,)

ggplot(pets, aes(pet, score, fill = pet)) +
  geom_boxplot()

### Scatter Plot
ggplot(pets, aes(age, score, color = pet)) +
  geom_point() + 
  geom_smooth(formula = y ~ x, method="lm")
























