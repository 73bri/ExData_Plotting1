dataset1 <- read.csv("household_power_consumption.txt", header=TRUE, 
                     sep=';', na.strings="?", nrows=2075259, 
                     check.names=FALSE, stringsAsFactors=FALSE, 
                     comment.char="", quote='\"')
dataset2 <- subset(dataset1, Date %in% c("1/2/2007","2/2/2007"))
dataset2$Date <- as.Date(dataset2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataset2$Date), dataset2$Time)
dataset2$Datetime <- as.POSIXct(datetime)

## Plot 2
with(dataset2, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
})

## Saving to file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()