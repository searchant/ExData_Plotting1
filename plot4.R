#code for plot4
Data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
newdata = subset(Data,Date ==  "1/2/2007" | Date ==  "2/2/2007", select = c(Date,Time,Global_active_power,Global_reactive_power,Voltage, Sub_metering_1,Sub_metering_2,Sub_metering_3 )) 
x<-paste(newdata[,1],newdata[,2])
x1 <- strptime(x, "%d/%m/%Y %H:%M:%S")
y1 <- newdata[,3]
y2 <- newdata[,4]
y3 <- newdata[,5]
y4 <- newdata[,6]
y5 <- newdata[,7]
y6 <- newdata[,8]

png(file = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)
par(mfrow = c(2,2))
plot(x1,y1,"l",xlab = "", ylab = "Global Active Power")
plot(x1,y3,"l",xlab = "datetime", ylab = "Voltage")

plot(x1,y4,"l",ylim=c(0,40),xlab ="",ylab = "Energy sub metering")
par(new=T)
plot(x1,y5,"l",col="red",ylim=c(0,40),xlab ="", ylab ="")
par(new = T)
plot(x1,y6,"l",col="blue",ylim=c(0,40),xlab ="", ylab ="")
legend("topright",lty=1,lwd =2, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(new = F)

plot(x1,y2,"l",xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
