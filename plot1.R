data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')

png("plot1.png",width=480,height=480)
hist(data$V3,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
