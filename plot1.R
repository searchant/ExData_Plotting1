## code for plot1
Data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
newdata = subset(Data,Date ==  "1/2/2007" | Date ==  "2/2/2007", select = c(Date,Time, Global_active_power)  ) 

png(file = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
hist(newdata$Global_active_power,col = "red", main = paste("Global Active Power"), xlab =  paste("Global Active Power(kilowatts)"))
dev.off()
