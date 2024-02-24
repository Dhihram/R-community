############################# Estimated Marginal Means in ggplo2
####### Based on linear mixed model

library(tidyr)
library(tidyverse)
library(ggplot2)
library(readxl)
library(dplyr)


### set up a random dataset
ID <- c(seq(1:25))
Group <- c(rep("High Arousal", 14), rep ("Low Arousal" ,11))
Time000 <- rnorm(25, 8, 1)
Time100 <- c(6,6,9,7,7,6,11,11,9,4,8,6,8,11,10,6,11,7,11,7,7,11,7,8,8)
Time200 <- c(6,10,12,9,11,6,11,15,6,8,11,9,9,9,11,18,11,6,12,13,7,16,7,16,10)
Time300 <- c(2,4,14,3,8,6,5,10,3,2,6,1,10,10,9,7,14,6,9,12,7,16,7,16,8)

df <- data.frame(ID, Group, Time000, Time100, Time200, Time300)

#df$Time000 <- scale(df$Time000)
#df$Time100 <- scale(df$Time100)
#df$Time200 <- scale(df$Time200)
#df$Time300 <- scale(df$Time300)

### convert to long
DF <- gather(df,Time,Pupil_Size, 3:6)

### set properties
DF$Group <- as.factor(DF$Group)
DF$Time <- as.factor(DF$Time)

### plot
(g1 <- ggplot(DF,aes(x=Time, y=Pupil_Size, fill=Group))+stat_boxplot(geom="errorbar")+
    geom_boxplot(lwd=0.5,outlier.color = "darkorange4", outlier.size = 4, outlier.shape = 23)+theme_bw())

### linear mixed model
library(lmerTest)
result1 <- lmer(Pupil_Size ~ Group*Time + (1 | ID), data=DF, REML=T)
anova(result1)


### Simple main effect
library(emmeans)
emmeans(result1, ~Group|Time) %>% pairs(adjust="Tukey",side = "=") # side not required if two-tailed

### estimated marginal means
### simple main effect plots
## Option 01
# https://cran.r-project.org/web/packages/emmeans/vignettes/basics.html


## option 02
emm1<- emmeans(result1, ~Group|Time)
(emm1<-as.data.frame(emm1))

(g3<- ggplot(emm1,aes(x=Time, y=emmean, group=Group, color=Group)) + theme_bw()+
    geom_line(size=1.25, position=position_dodge(0.2))+
    geom_point(size=2,position=position_dodge(0.2))+
    geom_errorbar(aes(ymin=lower.CL, ymax=upper.CL), width=0.2, size=1.25,
                  position = position_dodge(0.2))
    )



#####################################################
######################## Try  the Eye-link data
baseline <- read.csv("baseline.csv")
W0000 <- read.csv("W0000.csv")
W0100 <- read.csv("W0100.csv")
W0200 <- read.csv("W0200.csv")
W0300 <- read.csv("W0300.csv")
W0400 <- read.csv("W0400.csv")
W0500 <- read.csv("W0500.csv")
W0600 <- read.csv("W0600.csv")
W0700 <- read.csv("W0700.csv")
W0800 <- read.csv("W0800.csv")
W0900 <- read.csv("W0900.csv")
W1000 <- read.csv("W1000.csv")
W1100 <- read.csv("W1100.csv")
W1200 <- read.csv("W1200.csv")
W1300 <- read.csv("W1300.csv")
W1400 <- read.csv("W1400.csv")
W1500 <- read.csv("W1500.csv")
W1600 <- read.csv("W1600.csv")
W1700 <- read.csv("W1700.csv")
W1800 <- read.csv("W1800.csv")

# add category columns based on the time bins
baseline$Time <- "-100"
W0000$Time <- "000"
W0100$Time <- "100"
W0200$Time <- "200"
W0300$Time <- "300"
W0400$Time <- "400"
W0500$Time <- "500"
W0600$Time <- "600"
W0700$Time <- "700"
W0800$Time <- "800"
W0900$Time <- "900"
W1000$Time <- "1000"
W1100$Time <- "1100"
W1200$Time <- "1200"
W1300$Time <- "1300"
W1400$Time <- "1400"
W1500$Time <- "1500"
W1600$Time <- "1600"
W1700$Time <- "1700"
W1800$Time <- "1800"


# combine data for analysis
merged_data <- rbind(baseline, W0000, W0100, W0200, W0300, W0400, W0500, W0600, 
                      W0700, W0800, W0900, W1000, W1100, W1200, W1300, W1400, 
                      W1500, W1600, W1700, W1800)

# Include on analysed data
data_fix <- merged_data %>% 
  select(RECORDING_SESSION_LABEL, PUPIL_SIZE_MEAN, Time, trial_id)

# Assuming your data frame is named df
analysed_data <- data_fix %>%
  mutate(trial_id = sub(".*_(LA|HA|DT)$", "\\1", trial_id)) %>% 
  rename(ID = RECORDING_SESSION_LABEL) %>% 
  rename(pupil_size = PUPIL_SIZE_MEAN) %>% 
  rename(time = Time) %>% 
  rename(group = trial_id) %>% 
  filter(!grepl("DT", group))

# Converted Pupil Size Mean into decimal logarith
analysed_data$pupil_size <- as.numeric(analysed_data$pupil_size) # change data types into numeric
analysed_data$log_pupil <- log10(analysed_data$pupil_size)
analysed_data$log_pupil_scale <- scale(analysed_data$log_pupil)


# make category of Low Arousal and High Arousal
#analysed_data$Type_Arousal <- ifelse(analysed_data$log_pupil_scale < 0.33, "LA",
#                                     ifelse(analysed_data$log_pupil_scale > 0.66, "HA", NA))
# Assuming you have a data frame named analysed_data
#analysed_data <- na.omit(analysed_data)


(g11 <- ggplot(analysed_data,aes(x=time, y=log_pupil, fill=group))+stat_boxplot(geom="errorbar")+
    geom_boxplot(lwd=0.5,outlier.color = "darkorange4", outlier.size = 4, outlier.shape = 23)+theme_bw())



# regress LMM
emm_options(pbkrtest.limit = 38028)
emm_options(lmerTest.limit = 38028)

result2 <- lmer(log_pupil ~ group*time + (1 | ID), data=analysed_data,  REML=T)
anova(result2)

emmeans(result2, ~group|time) %>% pairs(adjust="Tukey",side = "=") # side not required if two-tailed
emm2<- emmeans(result2, ~group|time)
summary(emm2)
(emm2<-as.data.frame(emm2))

# I will hack it in excel hehe
write.csv(emm2, "emm2.csv", row.names = FALSE)


emm3 <- read.csv("emm3.csv")
emm3$time <- as.factor(emm3$time) 

emm4 <- emm3 %>%
  rename(Pupil = emmean)

  # change data types into numeric



(g12<- ggplot(emm4,aes(x=time, y=Pupil, group=group, color=group)) + theme_bw()+
    geom_line(size=1.25, position=position_dodge(0.2))+
    geom_point(size=2,position=position_dodge(0.2)) #+
    #geom_errorbar(aes(ymin=lower.CL, ymax=upper.CL), width=0.1, size=0.0001,
                  #position = position_dodge(0.2))
)


















