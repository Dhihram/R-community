library(ggplot2)
1+1

#histogram

##basic code

hist(births$bweight, breaks=20, col=2, xlab="Birth weight (gr)", main="An histogram")

##ggplot
ggplot(births, aes(x=bweight)) + geom_histogram() 
ggplot(births, aes(x=bweight)) + geom_histogram() + labs(x="Birth weight (gr)",y="Jumlah",
                                                         title="Frekuensi bweight di Indonesia",
                                                         caption = "Sumber data: Mirza Iqbal 1984")
ggplot(births, aes(x=bweight)) + geom_histogram(color="black", fill="white") + labs(x="Birth weight (gr)",y="Jumlah",
                                                         title="Frekuensi bweight di Indonesia",
                                                         caption = "Sumber data: Mirza Iqbal 1984")
ggplot(births, aes(x=bweight)) + geom_histogram(color="black", fill="white") +   scale_x_continuous(limits=c(0,5000)) + 
labs(x="Birth weight (gr)",y="Jumlah", title="Frekuensi bweight di Indonesia", caption = "Sumber data: Mirza")

ggplot(births, aes(x=bweight)) + geom_histogram(color="black", fill="white") +   scale_x_continuous(limits=c(0,5000)) + 
  labs(x="Birth weight (gr)",y="Jumlah", title="Frekuensi bweight di Indonesia", caption = "Sumber data: Mirza") + theme_minimal()


#barplot

##basic code

barplot(table(births$lowbw), horiz=TRUE, las=1, xlab="Frequency", 
        ylab="Low birth weight", main="A bar plot")

##ggplot

myTable <- table(births$lowbw)
myFrame <- as.data.frame(myTable)

ggplot(myFrame, aes(x=Freq, y=Var1)) + geom_bar(stat="identity", position="dodge")

ggplot(myFrame, aes(x=Freq, y=Var1)) + geom_bar(stat="identity", position="dodge", color = 'black', fill = 'gray')+ labs(x="Frequency",y="Low birth weight", title="Frekuensi low birth weight di Indonesia", caption = "Sumber data: Mirza Iqbal 1984")

ggplot(myFrame, aes(x=Freq, y=Var1)) + geom_bar(stat="identity", position="dodge", color = 'black', fill = 'gray') +
theme_minimal() + labs(x="Frequency",y="Low birth weight", title="Frekuensi low birth weight di Indonesia", caption = "Sumber data: Mirza Iqbal 1984")


#scatterplot

##basic plot

plot(bweight~gestwks, data=births)
plot(bweight~gestwks, data=births, xlab="Gestational week", ylab="Birth weight (gr)",
     xlim=c(25,45), pch=19, frame.plot=FALSE, col="red", cex=0.7)

##ggplot

ggplot(births, aes(x=gestwks, y=bweight)) + geom_point()

# pch: http://www.sthda.com/english/wiki/ggplot2-point-shapes
ggplot(births, aes(x=gestwks, y=bweight)) + geom_point(pch=16, col="red", cex=2) 
ggplot(births, aes(x=gestwks, y=bweight)) + geom_point(pch=16, col="red", cex=2)  + labs(x="Gestational week",y="Birth weight (gr)", title="Hubungan antara gestational week dan birth weight", caption = "Sumber data: Mirza Iqbal 1984")
ggplot(births, aes(x=gestwks, y=bweight)) + geom_point(pch=16, col="red", cex=2)  + labs(x="Gestational week",y="Birth weight (gr)", title="Hubungan antara gestational week dan birth weight", caption = "Sumber data: Mirza Iqbal 1984") + theme_minimal()

#linegraph

##basic plot
# Generate sequence of dates
start_date <- as.Date("1973-05-01")  # Assuming the start date
end_date <- as.Date("1973-09-30")    # Assuming the end date
airquality$Date <- seq(start_date, end_date, by = "day")

plot(airquality$Date, airquality$Temp, type="l", col="blue", lwd=1, xlab="Date", ylab="Temperature")
plot(airquality$Date, airquality$Temp, type="l", col="blue", lty="dashed", lwd=1, xlab="Date", ylab="Temperature")

##ggplot
ggplot(airquality, aes(x=Date, y=Temp)) + geom_line(color="blue", size=0.5)
ggplot(airquality, aes(x=Date, y=Temp)) + geom_line(color="blue", size=0.5, linetype="dashed") + labs(x="Date",y="Temperature", title="Temperature in New York", caption = "Source: New York City Department of Health and Mental Hygiene")
ggplot(airquality, aes(x=Date, y=Temp)) + geom_line(color="blue", size=0.5, linetype="dashed") + labs(x="Date",y="Temperature", title="Temperature in New York", caption = "Source: New York City Department of Health and Mental Hygiene") + theme_minimal()


#boxplot

##basic plot
boxplot(bweight~lowbw, data=births, col=c("red","blue"), xlab="Low birth weight", ylab="Birth weight (gr)", main="A boxplot")

##ggplot
ggplot(births, aes(x=as.factor(lowbw), y=bweight)) + geom_boxplot(fill=c("red","blue"))
ggplot(births, aes(x=as.factor(lowbw), y=bweight)) + geom_boxplot(fill=c("red","blue")) + labs(x="Low birth weight",y="Birth weight (gr)", title="A boxplot", caption = "Source: Mirza Iqbal 1984")
ggplot(births, aes(x=as.factor(lowbw), y=bweight)) + geom_boxplot(fill=c("red","blue")) + labs(x="Low birth weight",y="Birth weight (gr)", title="A boxplot", caption = "Source: Mirza Iqbal 1984") + theme_minimal()


#pie chart

##basic plot
pie(table(births$lowbw), col=c("red","blue"), main="A pie chart")

##ggplot
myTable <- table(births$lowbw)
myFrame <- as.data.frame(myTable)

ggplot(myFrame, aes(x="", y=Freq, fill=Var1)) + geom_bar(width = 1, stat = "identity")
ggplot(myFrame, aes(x="", y=Freq, fill=Var1)) + geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) + labs(title="A pie chart", caption = "Source: Mirza Iqbal 1984")
ggplot(myFrame, aes(x="", y=Freq, fill=Var1)) + geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) +labs(title="A pie chart", x = '', y = '', caption = "Source: Mirza Iqbal 1984") + theme_minimal() +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) + guides(fill=guide_legend(title="Low birth weight"))
ggplot(myFrame, aes(x="", y=Freq, fill=Var1)) + geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) + 
  geom_text(aes(label=Freq), position = position_stack(vjust = 0.5), size = 7) + labs(title="A pie chart", x = '', y = '', caption = "Source: Mirza Iqbal 1984") + theme_minimal() +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) + guides(fill=guide_legend(title="Low birth weight"))

#faceting

ggplot(births, aes(x=gestwks, y=bweight)) + geom_point() + facet_wrap(~lowbw)
ggplot(births, aes(x=gestwks, y=bweight)) + geom_point() + facet_wrap(~lowbw) + labs(x="Gestational week",y="Birth weight (gr)", title="Hubungan antara gestational week dan birth weight", caption = "Sumber data: Mirza Iqbal 1984")
