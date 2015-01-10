##############################################################################
# I find this exercise rather infuriating. The code is easy, I learned a lot #
# but there is no way in hell I can know exactly which font and size         #
# were used in the examples. If you mark me off for this, I will find you... #
##############################################################################

# debated to use file.choose() in case user had the data in a diff dir
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")
# Subset for February Data
rawData.sub <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007") , ]

# Plot Away!
png("plot1.png", width=480, height=480, bg="transparent")
hist(rawData.sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="red", cex.lab = 1, cex.axis=0.8)

dev.off()

