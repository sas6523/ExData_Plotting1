rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")

rawData.sub <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007") , ]

hist(rawData.sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="red")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
