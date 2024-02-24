################################################################################
# REGRESSION MODELS IN R - EXERCISES
################################################################################

################################################################################
# SECTIONs 1-2

## ####
## 1
## ####

data(mtcars)
#help(mtcars)

mylm <- lm(mpg ~ hp + wt + factor(vs) + factor(I(carb>2)), data=mtcars)

## ####
## 2
## ####

class(mylm)
str(mylm)
names(mylm)

mylm$coef
coef(mylm)

vcov(mylm)

names(summary(mylm))
summary(mylm)$r.squared

## ####
## 3
## ####

data(esoph)
#help(esoph)

myglm <- glm(cbind(ncases, ncontrols) ~ agegp + tobgp + alcgp, data=esoph, 
  family=binomial())

################################################################################ 
# SECTIONS 3-5

## ####
## 4
## ####

mf <- model.frame(mylm)

head(mf) ; head(mtcars)
# variables transformed in regression terms

## ####
## 5
## ####

# plot of residuals
plot(residuals(mylm) ~ wt, mtcars)

# obtain predictions
datapred <- data.frame(wt=mtcars$wt, hp=mean(mtcars$hp), vs=1, carb=2)
pred <- predict(mylm, newdata=datapred)

# plot predictions
plot(mpg ~ wt, mtcars)
lines(pred ~ wt, mtcars, col=2, lty=2)

## ####
## 6
## ####

summary(mylm)
summary(myglm)
# note the complex parametrisation of ordered factors. See ?contr.poly

## ####
## 7
## ####

# use drop1
drop1(myglm, test="LR")

# use anova (wrong way, it is sequential )
anova(myglm, test="LR")

# correct:
anova(myglm, update(myglm, .~.-tobgp), test="LR")
