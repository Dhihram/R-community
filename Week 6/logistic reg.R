# Admission Data

library(Epi)
library(ggplot2)
data(births)

# The data set contains the following

#EDA
summary(births)
str(births)
library(modeest)
births$preterm[is.na(births$preterm)] <- mfv(births$preterm)
births$gestwks[is.na(births$gestwks)] <- median(births$gestwks, na.rm = TRUE)
summary(births)
sapply(births, sd)

library(table1)
library(tidyverse)

#geom_point plot
plot(births$gestwks, births$lowbw)
abline(lm(births$lowbw ~ births$gestwks), col = "red")

#dummy variable < 17 years; 18–28 years; 29–39 years; > 40 years
births$matage_kat <- case_when(births$matage < 17 ~ 1,
                               births$matage >= 17 & births$matage < 29 ~ 2,
                               births$matage >= 29 & births$matage < 40 ~ 3,
                               births$matage >= 40 ~ 4)

#2x2 table
#buatlah 2x2 table untuk variabel lowbw dan preterm
#buat boxplot untuk lowbw dan gestwks

table <- births %>% mutate(lowbw = case_when(lowbw == 0 ~ "No", lowbw == 1 ~ "Yes"),
                           hyp = case_when(hyp == 0 ~ "No", hyp == 1 ~ "Yes"),
                           preterm = case_when(preterm == 0 ~ "No", preterm == 1 ~ "Yes"),
                           sex = case_when(sex == 1 ~ 'Female', sex == 2 ~ 'Male'),
                           matage_kat = case_when(matage_kat == 1 ~ "< 17 years",
                                                  matage_kat == 2 ~ "18–28 years",
                                                  matage_kat == 3 ~ "29–39 years",
                                                  matage_kat == 4 ~ "> 40 years"))
table$matage_kat <- factor(table$matage_kat, levels = c("< 17 years", "18–28 years", "29–39 years", "> 40 years"))

label(table$bweight)       <- "Birth Weight"
label(table$lowbw)       <- "Low Birth Weight"
label(table$gestwks)     <- "Gestation Weeks"
label(table$hyp)         <- "Hypertension"
label(table$preterm)     <- "Preterm"
label(table$sex)         <- 'Sex'
label(table$matage_kat)      <- 'Maternal Age'

units(table$bweight)       <- "gr"
units(table$matage)       <- "years"

caption  <- "Table 1. Descrpitive Stats"

table1(~ bweight + gestwks_kat + hyp + preterm + sex + matage_kat| lowbw, data=table, caption = caption)



#model

library(broom)
mylogit <- glm(as.factor(lowbw) ~ as.factor(gestwks_kat), data = table, family = "binomial")
summary(mylogit)
tidy(mylogit, exponentiate=TRUE, conf.int=TRUE)
mylogit2 <- glm(as.factor(lowbw) ~ as.factor(preterm) + as.factor(hyp), data = table, family = "binomial")
summary(mylogit2)
tidy(mylogit2, exponentiate=TRUE, conf.int=TRUE)
mylogit3 <- glm(as.factor(lowbw) ~ as.factor(preterm) + as.factor(sex) +as.factor(matage_kat) + as.factor(hyp), data = table, family = "binomial")
summary(mylogit3)
tidy(mylogit3, exponentiate=TRUE, conf.int=TRUE)
mylogit4 <- glm(as.factor(lowbw) ~ as.factor(preterm) + as.factor(preterm) + as.factor(matage_kat) + as.factor(hyp) + as.factor(matage_kat)*as.factor(sex), data = table, family = "binomial")
summary(mylogit4)
tidy(mylogit4, exponentiate=TRUE, conf.int=TRUE)


#GOF
#hosmer-lemeshowa
library(performance)
performance_hosmer(mylogit3, n_bins = 5)
performance_hosmer(mylogit4, n_bins = 5)

#anova
library(lmtest)
lrtest(mylogit, mylogit2)
lrtest(mylogit, mylogit3)
lrtest(mylogit, mylogit4)
lrtest(mylogit2, mylogit3)
lrtest(mylogit2, mylogit4)
lrtest(mylogit3, mylogit4)


#aic
AIC(mylogit, mylogit2, mylogit3, mylogit4)

#OR
tidy(mylogit4, exponentiate=TRUE, conf.int=TRUE)
exp(coef(mylogit4))
exp(confint(mylogit4))
tidy(mylogit2, exponentiate=TRUE, conf.int=TRUE)
exp(coef(mylogit2))
exp(confint(mylogit2))
