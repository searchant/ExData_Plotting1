#code for plot3
#read file , subset for 2 days only
Data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
newdata = subset(Data,Date ==  "1/2/2007" | Date ==  "2/2/2007", select = c(Date,Time, Sub_metering_1,Sub_metering_2,Sub_metering_3 )) 
x<-paste(newdata[,1],newdata[,2])
x1 <- strptime(x, "%d/%m/%Y %H:%M:%S")
y1 <- newdata[,3]
y2 <- newdata[,4]
y3 <- newdata[,5]

png(file = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(x1,y1,"l",ylim=c(0,40),xlab ="",ylab = "Energy sub metering")
par(new=T)
plot(x1,y2,"l",col="red",ylim=c(0,40),xlab ="", ylab ="")
par(new = T)
plot(x1,y3,"l",col="blue",ylim=c(0,40),xlab ="", ylab ="")
legend("topright",lty=1,lwd =2, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(new = F)
dev.off()
