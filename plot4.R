rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")

rawData.sub <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007") , ]


rawData.sub$DateTime <-paste(rawData.sub$Date, rawData.sub$Time)
rawData.sub$DateTime <- as.POSIXct(paste(rawData.sub$Date, rawData.sub$Time), format="%d/%m/%Y %H:%M:%S") 


par(mfrow = c(2,2))

# Plot #1
plot(rawData.sub$DateTime,rawData.sub$Global_active_power,type="n", xlab="", ylab="Global Active Power", cex.lab = 0.8, cex.axis=0.8)
lines(rawData.sub$DateTime,rawData.sub$Global_active_power)

# plot #2
plot(rawData.sub$DateTime,rawData.sub$Voltage,type="n", xlab="datetime", ylab="Voltage", cex.lab = 0.8,cex.axis=0.8)
lines(rawData.sub$DateTime,rawData.sub$Voltage)

# plot #3
plot(rawData.sub$DateTime,rawData.sub$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering", cex.lab = 0.8,cex.axis=0.8)
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_1)
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_2, col="red")
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.5, bty="n")

# plot #4
plot(rawData.sub$DateTime,rawData.sub$Global_reactive_power,type="n", xlab="datetime", ylab="Global_reactive_power", cex.lab = 0.8, cex.axis=0.8)
#axis(2, cex.axis=0.8)
lines(rawData.sub$DateTime,rawData.sub$Global_reactive_power)

# Write to file
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()

