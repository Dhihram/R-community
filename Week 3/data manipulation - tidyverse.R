# Introduction to Tidyverse

# first, install reprores package
devtools::install_github("psyteachr/reprores-v2")
# install.packages("devtools")

# install devtools if you dont have
#install tidyverse if you haven't installed the package
# load these library
library(dplyr)
library(tidyr)
library(reprores)


# there are set of data in reprores package
# check it out lists datasets in reprores
data(package = "reprores")

# look at a dataset
smalldata

# loads smalldata into the environment
data("smalldata")

# You can get a quick summary of a dataset with the summary() function.
summary(smalldata)

# You can even do things like calculate the difference between the means of two columns.
pre_mean <- mean(smalldata$pre)
post_mean <- mean(smalldata$post)
post_mean - pre_mean
################################################################################
# Be able to use the 6 main dplyr one-table verbs: select(), filter(), arrange(), 
# mutate(), summarise(), group_by()

### select()
# kita pake data disgust
data("disgust", package = "reprores")

# Select columns by name or number.
# You can select each column individually, separated by commas (e.g., col1, col2). You can also select all columns between two columns by separating them with a colon (e.g., start_col:end_col).
moral <- disgust %>% 
  select(user_id, moral1:moral7)

# You can select columns by number, which is useful when the column names are long or complicated.
sexual <- disgust %>% 
  select(2, 11:17)

# You can use a minus symbol to unselect columns
pathogen <- disgust %>% 
  select(-id, -date, -(moral1:sexual7))

# Select columns that start with a character string = start_with.
u <- disgust %>% 
  select(starts_with("u"))

# Select columns that end with a character string = ends_with.
firstq <- disgust %>% 
  select(ends_with("1"))

################################################################################
### Filter()
# Select rows by matching column criteria.
# Select all rows where the user_id is 1
user_1 <- disgust %>% 
  filter(user_id == 1)

# You can select on multiple criteria by separating them with commas.
amoral <- disgust %>% filter(
  moral1 == 0, 
  moral2 == 0,
  moral3 == 0, 
  moral4 == 0,
  moral5 == 0,
  moral6 == 0,
  moral7 == 0
)

# You can use the symbols &, |, and ! to mean "and", "or", and "not". You can also use other operators to make equations.
# everyone who chose either 0 or 7 for question moral1
moral_extremes <- disgust %>% 
  filter(moral1 == 0 | moral1 == 7)

# everyone who chose the same answer for all moral questions
moral_consistent <- disgust %>% 
  filter(
    moral2 == moral1 & 
      moral3 == moral1 & 
      moral4 == moral1 &
      moral5 == moral1 &
      moral6 == moral1 &
      moral7 == moral1
  ) # biasanya dipake buat eliminate outliers yang gak niat ngisi data


#You can use - install.packages("lubridate") - package to work with dates. For example, you can use the year() function to return just the year from the date column and then select only data collected in 2010.
install.packages("lubridate")
library(lubridate)

disgust2010 <- disgust %>% filter(year(date) == 2010)

################################################################################
### mutate()
disgust_total <- disgust %>% 
  mutate(moral_total = moral1 + moral2 + moral3 + moral4 + moral5 + moral6 + moral7,
         sexual_total = sexual1 + sexual2 + sexual3 + sexual4 + sexual5 + sexual6 + sexual7,
         pathogen_total = pathogen1 + pathogen2 + pathogen3 + pathogen4 + pathogen5 + pathogen6 + pathogen7,
         total = moral_total + sexual_total + pathogen_total
         )

### summarise() = aggregating dataset
# mean(), n(), min(), max(), sd()

disgust_summary<- disgust_total %>%
  summarise(
    n = n(),
    avg_total = mean(total, na.rm = TRUE),
    sd_total  = sd(total, na.rm = TRUE),
    min_total = min(total, na.rm = TRUE),
    max_total = max(total, na.rm = TRUE)
  )

moral_summary <- disgust_total %>% 
  summarise(
    mean_moral = mean(moral_total, na.rm = TRUE),
    sd_moral = sd(moral_total, na.rm = TRUE),
    min_moral = min(moral_total, na.rm = TRUE),
    max_moral = max(moral_total, na.rm = TRUE)
  )

# group_by()
data("pets")
pet_avg <- pets %>% 
  group_by(pet) %>% 
  summarise(avg_weight = mean(weight),
            avg_age = mean(age)
            )

################### TUGAS
# load dataset "pets" dari package "reprores"
data("pets")
# pilihlah data yang hanya mencakup hewan peliharaan (pet) "dog" saja 
dogs_data <- pets %>%
  filter(pet == "dog")
# pilihlah kolom ID, pet, dan score saja
dogs_data <- pets %>%
  select(id, pet, score)
# carilah rata-rata score dari masing2 jenis pet dan country
average_scores <- pets %>%
  group_by(pet) %>%
  summarise(average_score = mean(score, na.rm = TRUE))
