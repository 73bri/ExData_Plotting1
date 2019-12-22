dataset1 <- read.csv("household_power_consumption.txt", header=TRUE, 
                     sep=';', na.strings="?", nrows=2075259, 
                     check.names=FALSE, stringsAsFactors=FALSE, 
                     comment.char="", quote='\"')
dataset2 <- subset(dataset1, Date %in% c("1/2/2007","2/2/2007"))
dataset2$Date <- as.Date(dataset2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataset2$Date), dataset2$Time)
dataset2$Datetime <- as.POSIXct(datetime)

## Plot 3
with(dataset2, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
