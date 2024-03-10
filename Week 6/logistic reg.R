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

#2x2 table
#buatlah 2x2 table untuk variabel lowbw dan preterm
#buat boxplot untuk lowbw dan gestwks

table <- births %>% mutate(lowbw = case_when(lowbw == 0 ~ "No", lowbw == 1 ~ "Yes"),
                           hyp = case_when(hyp == 0 ~ "No", hyp == 1 ~ "Yes"),
                           preterm = case_when(preterm == 0 ~ "No", preterm == 1 ~ "Yes"),
                           sex = case_when(sex == 1 ~ 'Female', sex == 2 ~ 'Male'))

label(table$bweight)       <- "Birth Weight"
label(table$lowbw)       <- "Low Birth Weight"
label(table$gestwks)     <- "Gestation Weeks"
label(table$hyp)         <- "Hypertension"
label(table$preterm)     <- "Preterm"
label(table$sex)         <- 'Sex'
label(table$matage)      <- 'Maternal Age'

units(table$bweight)       <- "gr"
units(table$matage)       <- "years"

caption  <- "Table 1. Descrpitive Stats"

table1(~ bweight + gestwks + hyp + preterm + sex + matage| lowbw, data=table, caption = caption)


#model

library(broom)
mylogit <- glm(as.factor(lowbw) ~ as.factor(preterm), data = table, family = "binomial")
summary(mylogit)
tidy(mylogit, exponentiate=TRUE, conf.int=TRUE)
mylogit2 <- glm(as.factor(lowbw) ~ as.factor(preterm) + hyp, data = table, family = "binomial")
summary(mylogit2)
tidy(mylogit2, exponentiate=TRUE, conf.int=TRUE)
mylogit3 <- glm(as.factor(lowbw) ~ as.factor(preterm) + gestwks + as.factor(sex) + matage + hyp, data = table, family = "binomial")
summary(mylogit3)
tidy(mylogit3, exponentiate=TRUE, conf.int=TRUE)
mylogit4 <- glm(as.factor(lowbw) ~ gestwks + as.factor(preterm) + as.factor(preterm) + matage + hyp + gestwks*as.factor(sex), data = table, family = "binomial")
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
