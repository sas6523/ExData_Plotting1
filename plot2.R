rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")

rawData.sub <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007") , ]


rawData.sub$DateTime <-paste(rawData.sub$Date, rawData.sub$Time)
rawData.sub$DateTime <- as.POSIXct(paste(rawData.sub$Date, rawData.sub$Time), format="%d/%m/%Y %H:%M:%S") 


plot(rawData.sub$DateTime,rawData.sub$Global_active_power,type="n", xlab="", ylab="Global Active Power (Kilowatts)")
lines(rawData.sub$DateTime,rawData.sub$Global_active_power)

dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
