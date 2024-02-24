################################################################################
# REGRESSION MODELS IN R
################################################################################

################################################################################
# THE MODEL FORMULA

# regression models: essential statistical tools
# regression functions share similar features and structures

# install the package Epi
#install.packages("Epi")

# load the package Epi and dataframe births
library(Epi)
data(births)

# formula: symbolic expression of the model

# examples of formulae
f1 <- bweight ~ gestwks
f2 <- bweight ~ gestwks + matage

# use of expressions involving functions in formula
bweight ~ gestwks + factor(sex)

# interactions
bweight ~ gestwks:matage
bweight ~ gestwks*matage

# exclude terms with the minus sign (or 0 for the intercept)
bweight ~ -1 + gestwks
bweight ~ 0 + gestwks

# protected expressions
bweight ~ gestwks + I(gestwks^2) + matage

################################################################################
# LINEAR AND GENERALIZED LINEAR MODELS

# linear and generalized linear models

# fit a linear model with lm
lm1 <- lm(bweight ~ gestwks, data=births)

# print the regression object
lm1

# use of summmary
lm2 <- lm(bweight ~ gestwks + matage + factor(sex), data=births)
summary(lm2)

# fit a glm
glm1 <- glm(lowbw ~ gestwks, births, family=binomial(link="logit"))
summary(glm1)

# the model object with several pieces of information
names(lm1)
names(summary(lm1))

#########################################
## Exercises
#########################################

################################################################################
# FITTING PROCEDURES

# fitting procedure and additional arguments
lm1b <- lm(bweight~gestwks, data=births, subset=sex==1&hyp==0, na.action=na.exclude)

# other arguments
#help(lm)

# the model frame
mframe <- model.frame(lm2)
head(mframe, 3)

# the design matrix
births$matagegr <- cut(births$matage, breaks=c(0,30,35,100), right=F)
Xdes <- model.matrix(~ gestwks * matagegr + factor(hyp), births)
head(Xdes, 3)

# other functions: model.response and model.extract

################################################################################
# RESIDUALS, MODEL DIAGNOSTICS, AND PREDICTIONS

# diagnostics: model residuals
res <- residuals(lm2)
plot(res, col=4, ylim=c(-2000,2000), ylab="Residuals")
abline(h=0)

# dealing with missing in residuals/predictions
lm2b <- update(lm2, na.action=na.exclude)
resb <- residuals(lm2b)
head(res, 3)
head(resb, 4)

# checking the linearity assumption 
plot(resb~gestwks, births, col=3, ylim=c(-2000,2000), xlab="Gestational week",
  ylab="Residuals")
abline(h=0)
lines(lowess(births$gestwks, resb, delta=0.1, f=1/3), col=2, lwd=1.5)

# standardized residuals, and othe types
standres <- rstandard(lm2b) 
qqnorm(standres)
abline(a=0, b=1, h=0, v=0)

# another common task: predictions

# using abline in univariate regression
plot(bweight ~ gestwks, data=births, col=grey(0.7))
abline(lm1, col=2, lwd=1.5)

# the function predict
pred <- predict(lm2b)
head(pred)

# predict using a new set of data
newdata <- data.frame(gestwks=25:43, matage=mean(births$matage, na.rm=T), sex=1)
newpred <- predict(lm2, newdata=newdata, se.fit=T)
names(newpred)
head(newpred$fit)

# plot the predictions
plot(25:43, newpred$fit, type="l", xlim=c(23,45), ylim=c(0,5000),
  xlab="Gestational week", ylab="Birth weight", col=4, lwd=1.5)
lines(25:43, newpred$fit+1.96*newpred$se, col=4, lty=2)
lines(25:43, newpred$fit-1.96*newpred$se, col=4, lty=2)

# predictions in GLMs: different types
newpred2 <- predict(glm1, newdata=newdata, type="response")
plot(25:43, newpred2, type="l", xlim=c(23,45), xlab="Gestational week",
  ylab="Proportion og low birth weight", col=2, lwd=1.5)
abline(v=37, lty=2)

# predict at a specific value
predict(glm1, data.frame(gestwks=37), type="response")

################################################################################
# INFERENCE AND MODEL SELECTION

# the drop1 function
drop1(lm2, test="F")

# the anova function for more general hypothesis testing
anova(lm1, lm2, test="F")

# update glm1
glm2 <- update(glm1, . ~ . + factor(hyp))

# test
anova(glm1, glm2, test="LR")

################################################################################
# OTHER REGRESSION MODELS

# many other regression methods implemented in stardand and recommeded pkg

# an example of linear mixed-effect model
library(nlme)
lme1 <- lme(distance ~ age, data=Orthodont, random= ~ age | Subject)
summary(lme1)

# an example Cox proportional hazard model
library(survival)
cox1 <- coxph(Surv(time, status) ~ x, aml)
summary(cox1)

# most of the regression classes adopt similar fitting structure
# most share methods (eg coef, predict, anova, etc)

#########################################
## Exercises
#########################################
