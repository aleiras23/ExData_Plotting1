## Reading data
powerfile <- "household_power_consumption.txt"
power <- read.table(powerfile, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting the data
subsetpower <- subset(power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(subsetpower$Date), subsetpower$Time)
subsetpower$Datetime <- as.POSIXct(datetime)


## Plotting #2
plot(subsetpower$Datetime, subsetpower$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")

## Saving to file
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()
