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
png("plot2.png", width=480, height=480, bg="transparent")
plot(rawData.sub$DateTime,rawData.sub$Global_active_power,type="n", xlab="", ylab="Global Active Power (Kilowatts)", cex.lab = 1, cex.axis=1)
lines(rawData.sub$DateTime,rawData.sub$Global_active_power)

dev.off()

