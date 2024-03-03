### UJI BEDA PROPORSI, UJI BEDA MEAN, UJI HIPOTESIS

library(Epi)
data(births)

### UJI BEDA PROPORSI

###  CHI SQUARE TEST

buattabel <- table(births$lowbw,births$preterm)
buattabel

chisq.test(buattabel)$expected

chisq.test(births$lowbw,births$preterm)


###  FISHER EXACT TEST

buattabel2 <- table(births$lowbw,births$preterm)
buattabel2
chisq.test(buattabel2)$expected

fisher.test(births$lowbw,births$preterm)

### UJI BEDA MEAN

###  T TEST

#### ONE SAMPLE

shapiro.test(births$bweight)
hist(births$bweight)
abline(v = mean(births$bweight), col = "red", lwd=3, lty=2)
abline(v = median(births$bweight), col = "blue", lwd=3, lty=2)


t.test(births$bweight, mu = 2500, alternative = "two.sided")
t.test(births$bweight, mu = 2500, alternative = "greater")
t.test(births$bweight, mu = 2500, alternative = "less")

### TWO SAMPLE
births$bweight2 <- rnorm(n = nrow(births), mean = 4200, sd = 2000)
hist(births$bweight2)
abline(v = mean(births$bweight2), col = "red", lwd=3, lty=2)
abline(v = median(births$bweight2), col = "blue", lwd=3, lty=2)


t.test(births$bweight, births$bweight2, alternative = "two.sided", paired = T)
t.test(births$bweight, births$bweight2, alternative = "greater", paired = T)
t.test(births$bweight, births$bweight2, alternative = "less", paired = T)

### ANOVA

### ONE WAY

onewayanova <- aov(bweight ~ gestwks, data = births)

shapiro.test(onewayanova$residuals)

summary(onewayanova)


### TWO WAY ANOVA

twowayanova <- aov(bweight ~ gestwks + matage + sex, data = births)

shapiro.test(twowayanova$residuals)

summary(twowayanova)

### UJI HUBUNGAN

### UJI KORELASI PEARSON

library(ggplot2)
ggplot(births, aes(x=gestwks, y=bweight)) + geom_point()

cor.test(births$bweight,births$gestwks, method="pearson")

### UJI KORELASI SPEARMAN
cor.test(births$bweight,births$gestwks, method='spearman', exact=F)


### UJI REGRESI SEDERHANA
reg <- lm(bweight ~ gestwks, data = births)
summary(reg)
ggplot(births, aes(x=gestwks, y=bweight)) + geom_point() + geom_smooth(method = "lm")

