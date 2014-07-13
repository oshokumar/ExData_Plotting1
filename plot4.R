data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
datetime <- strptime( paste(data$V1,data$V2), format="%d/%m/%Y %H:%M:%S")


png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))

with(data, plot(datetime, V3, type="l",xlab="",ylab="Global Active Power(kilowatts)"))

plot (x=datetime, y= data$V7,type ="l",xlab ="",ylab = "Energy sub metering")

lines (x=datetime, y=data$V8, col ="red")
lines (x=datetime, y=data$V9, col ="blue")

legend("topright",c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,2),
       bty="n",
       lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))

with(data, plot(datetime, V5, type="l",ylab="Voltage"))

with(data, plot(datetime, V4, type="l",ylab="Global_reactive_power"))

dev.off()





