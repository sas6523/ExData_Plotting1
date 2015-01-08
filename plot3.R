rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")

rawData.sub <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007") , ]


rawData.sub$DateTime <-paste(rawData.sub$Date, rawData.sub$Time)
rawData.sub$DateTime <- as.POSIXct(paste(rawData.sub$Date, rawData.sub$Time), format="%d/%m/%Y %H:%M:%S") 


plot(rawData.sub$DateTime,rawData.sub$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_1)
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_2, col="red")
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()