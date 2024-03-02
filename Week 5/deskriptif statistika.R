### STATISTIKA DESKRIPTIF ###

library(Epi)
data(births)


str(births)

# mengecek missing value
colSums(is.na(births))

# melihat statistika deskriptif
summary(births)

# menghitung mean atau rata-rata 
mean(births$bweight)

# menghitung median
median(births$bweight)

# menghitung modus 
library(modeest)
mfv(births$hyp)
mfv(births$lowbw)

# menghitung variance atau ragam
var(births$bweight)
var(births$gestwks)
var(births$gestwks, na.rm=TRUE)

# menghitung simpangan baku atau standar deviasi 
sd(births$bweight)
sd(births$bweight)

# menghitung rata variabel numerik tertentu beradasrkan variabel kategorik
aggregate(bweight~hyp+sex, data = births, mean)

# menghitung median variabel numerik tertentu beradasrkan variabel kategorik
aggregate(bweight~hyp+sex, data = births, median)

# menghitung jumlah variabel numerik tertentu beradasrkan variabel kategorik
aggregate(bweight~sex, data = births, sum)

# menghitung varians variabel numerik tertentu beradasrkan variabel kategorik
aggregate(bweight~sex, data = births, var)

# menghitung standar deviasi variabel numerik tertentu beradasrkan variabel kategorik
aggregate(bweight~sex, data = births, sd)

#menghitung frekuensi variabel kategorik
table(births$sex)
data.frame(table(births$sex))

#menghitung persentase variabel kategorik
prop.table(table(births$sex))

data.frame(prop.table(table(births$sex)))
datapersen=data.frame(prop.table(table(births$sex)))
colnames(datapersen)=c("BIRTH SEX","PROPORTION")
datapersen
