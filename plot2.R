#code for plot 2, combine Date and Time convert to R Date format
Data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
newdata = subset(Data,Date ==  "1/2/2007" | Date ==  "2/2/2007", select = c(Date,Time, Global_active_power)  ) 

x<-paste(newdata[,1],newdata[,2])
x1 <- strptime(x, "%d/%m/%Y %H:%M:%S")
y <- newdata[,3]

png(file = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(x1,y,"l",xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
