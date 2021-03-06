##############################################################################
# I find this exercise rather infuriating. The code is easy, I learned a lot #
# but there is no way in hell I can know exactly which font and size         #
# were used in the examples. If you mark me off for this, I will find you... #
##############################################################################

# debated to use file.choose() in case user had the data in a diff dir
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
# Subset for February Data
rawData.sub <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007") , ]

# Create a new column the combines date and time columns
rawData.sub$DateTime <-paste(rawData.sub$Date, rawData.sub$Time)
# Format the datetime
rawData.sub$DateTime <- as.POSIXct(paste(rawData.sub$Date, rawData.sub$Time), format="%d/%m/%Y %H:%M:%S") 

# Plot Away!
png("plot4.png", width=480, height=480, bg="transparent")

# set plotting space to 2 x2 
par(mfrow = c(2,2))

# Plot #1
plot(rawData.sub$DateTime,rawData.sub$Global_active_power,type="n", xlab="", ylab="Global Active Power", cex.lab = 1, cex.axis=1)
lines(rawData.sub$DateTime,rawData.sub$Global_active_power)

# plot #2
plot(rawData.sub$DateTime,rawData.sub$Voltage,type="n", xlab="datetime", ylab="Voltage", cex.lab = 1,cex.axis=1)
lines(rawData.sub$DateTime,rawData.sub$Voltage)

# plot #3
plot(rawData.sub$DateTime,rawData.sub$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering", cex.lab = 1,cex.axis=1)
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_1)
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_2, col="red")
lines(rawData.sub$DateTime,rawData.sub$Sub_metering_3, col="blue")
# plot #3's Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.7, bty="n")

# plot #4
plot(rawData.sub$DateTime,rawData.sub$Global_reactive_power,type="n", xlab="datetime", ylab="Global_reactive_power", cex.lab = 1, cex.axis=0.8)
lines(rawData.sub$DateTime,rawData.sub$Global_reactive_power)

dev.off()

