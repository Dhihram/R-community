# Menggunakan Tidyverse

# load the dplyr and tidyr packages
library(dplyr) ; library(tidyr)


################################################################################
# TIDY DATA AND TIDYVERSE FEATURES
data(mtcars)

# ordering a dataset with standard R tools
mtcars[order(mtcars$mpg),]

# ordering a dataset with tidyverse functions
arrange(mtcars, mpg)

# tidyverse: common data structure, pipes, non-standard evaluation

################################################################################
# MANAGING VARIABLES

# load the package Epi and births (uncomment if needs installing)
#install.packages("Epi")
library(Epi)
data(births)

# the function mutate()
mutate(births, preterm = factor(preterm, labels=c("no","yes"))) |> head(3)

# creating and transforming multiple variables
births <- mutate(births,
                 preterm = factor(preterm, labels=c("no","yes")),
                 hyp = factor(hyp, labels=c("no","yes")),
                 sex = factor(sex, labels=c("male","female")),
                 matagegr = cut(matage, breaks=c(0,30,35,100), right=F)
)
head(births, 3)

# more specialised usages, for example using across() 

################################################################################
# LABELLING, SUBSETTING, AND REORDERING DATASETS

# have a look at esoph
data(esoph)
esoph
head(esoph, 3)

# labelling
esoph <- rename(esoph, age=agegp, alcohol=alcgp, tobacco=tobgp, cases=ncases, 
                controls=ncontrols)
head(esoph, 3)

# subsetting
esoph |> filter(age=="55-64", tobacco %in% c("10-19","20-29")) |>
  select(alcohol, tobacco, cases, controls)

# use of specific operators and functions 
select(esoph, alcohol:controls) |> head(3)
select(esoph, !alcohol:controls) |> head(3)
select(esoph, -age) |> head(3)
select(esoph, starts_with("a")) |> head(3)
select(esoph, contains("l")) |> head(3)

# note the usual syntax with a call to the data followed by piped operations
# also note the use of unquoted names referring to variables

# other functions useful to subset or extract, useful in piped operations
slice(esoph, 4:5)
pull(esoph, tobacco) |> head()

# other examples
slice_max(esoph, cases, n=3) # the records with the largest values of a var 
pull(esoph, 2) # second
pull(esoph, -2) # second from last

# however, even with standard indexing and extraction operators
esoph |> _[3:5,]
esoph |> _$tobacco

# reordering rows and columns
esoph <- arrange(esoph, tobacco, alcohol, age) |> select(c(3:1,4:5))
esoph

# descending order
arrange(esoph, tobacco) |> head()
arrange(esoph, desc(tobacco)) |> head()

# all in one step 
rm(esoph)
data(esoph)
esoph |>
  rename(age=agegp, alcohol=alcgp, tobacco=tobgp, cases=ncases, 
         controls=ncontrols) |>
  filter(age=="55-64" & tobacco %in% c("10-19","20-29")) |>
  select(alcohol, tobacco, cases, controls) |>
  arrange(tobacco, alcohol)

################################################################################
# APPENDING, MERGING, AND RESHAPING DATASETS

# have a look at mtcars
head(mtcars, 3)

# an example of appending with rbind()
bind_rows(mtcars[1:2,], mtcars[1:2,])

# create a score for forward gears related to mtcars
gearscore <- data.frame(gear=3:6, score=c(2.1, 7.5, 8.1, 8.3))

# merging
inner_join(mtcars, gearscore, by="gear")
full_join(mtcars, gearscore, by="gear")


# alternatively, left_join(), right_join(), and full_join()

data(sleep)
sleep
# let's have a look to sleep
head(sleep, 3)

# reshaping from long to wide
sleepwide <- pivot_wider(sleep, id_cols=ID, values_from=extra, names_from=group,
                         names_prefix="extra")
head(sleepwide, 3)


# reshaping from wide to long
pivot_longer(sleepwide, cols=2:3, values_to="extra", names_to="group") |>
  head(3)


################################################################################
# AGGREGATING DATASETS

# a simple aggregation
data(mtcars)
summarise(mtcars, 
          avgmpg=mean(mpg), 
          medhp=median(hp)) 

aggregate(mpg~vs,mtcars, FUN=median)

# aggregating by groups using the argument .by
summarise(mtcars, avgmpg=mean(mpg), medhp=median(hp), .by=c(vs,am)) 

# aggregating by groups
mtcars |> group_by(vs, am) |> summarise(avgmpg=mean(mpg), medhp=median(hp)) 

# aggregating with multiple values
mtcars |> 
  group_by(vs) |> 
  reframe(probs=paste0(1:3*25, "%"), mpg=quantile(mpg, 1:3*25/100))


