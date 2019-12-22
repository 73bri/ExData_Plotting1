dataset1 <- read.csv("household_power_consumption.txt", header=TRUE, 
                     sep=';', na.strings="?", nrows=2075259, 
                     check.names=FALSE, stringsAsFactors=FALSE, 
                     comment.char="", quote='\"')
dataset2 <- subset(dataset1, Date %in% c("1/2/2007","2/2/2007"))
dataset2$Date <- as.Date(dataset2$Date, format="%d/%m/%Y")

## Plot 1
hist(dataset2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
