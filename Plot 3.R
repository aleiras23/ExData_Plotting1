## Reading data
powerfile <- "household_power_consumption.txt"
power <- read.table(powerfile, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting the data
subsetpower <- subset(power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(subsetpower$Date), subsetpower$Time)
subsetpower$Datetime <- as.POSIXct(datetime)


## Plotting #3
with(subsetpower, {
    plot(Sub_metering_1~Datetime, type = "l",
         ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2~Datetime, col= 'Red')
    lines(Sub_metering_3~Datetime, col= 'Blue')
})
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 0.5, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()
