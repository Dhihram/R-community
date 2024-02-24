# install devtools
install.packages("devtools")

# install reprores
devtools::install_github("psyteachr/reprores-v2")

# library
library("reprores")
library(tidyverse)

# check list dataset
data(package = "reprores")

# load dataset
data("smalldata")

summary(smalldata)

pre_mean <- mean(smalldata$pre)
post_mean <- mean(smalldata$post)
differences_mean <- post_mean - pre_mean


### dplyr
library(dplyr)
library(tidyr)

### select()
data("disgust")

moral <- disgust %>% select(user_id, moral1:moral7)

sexual <- disgust %>% 
  select(2, 11:17)

pathogen <- disgust %>% 
  select(-id, -date, -(moral1:sexual7))

m <- disgust %>% 
  select(starts_with("m"))

one <- disgust %>% 
  select(ends_with("1"))

#### Filter
user_1 <- disgust %>% 
  filter(user_id == 1)

# kita cari orang2 yang gak punya moral
amoral <- disgust %>% filter(
  moral1 == 0,
  moral2 == 0,
  moral3 == 0,
  moral4 == 0,
  moral5 == 0,
  moral6 == 0,
  moral7 == 0,
  )

# everyone chose either 0 or 7 in moral1-moral7
moral_extreme <- disgust %>% 
  filter(moral1 == 0 | moral1 == 7,
         moral2 == 0 | moral2 == 7,
         moral3 == 0 | moral3 == 7,
         moral4 == 0 | moral4 == 7,
         moral5 == 0 | moral5 == 7,
         moral6 == 0 | moral6 == 7,
         moral7 == 0 | moral7 == 7,
         )

# argument &
moral_consistent <- disgust %>% 
  filter(
    moral2 != moral1 & 
      moral3 != moral1 & 
      moral4 != moral1 &
      moral5 != moral1 &
      moral6 != moral1 &
      moral7 != moral1
  )
# To exclude moral consistent rows (where all moral values are equal)
disgust_filtered <- disgust %>% 
  filter(!(
    moral1 == moral2 & 
      moral2 == moral3 & 
      moral3 == moral4 & 
      moral4 == moral5 & 
      moral5 == moral6 & 
      moral6 == moral7
  ))

disgut2010 <- disgust %>% 
  filter(year(date) == 2010)


data(mtcars)





