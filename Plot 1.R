## Reading file
powerfile <- "household_power_consumption.txt"
power <- read.table(powerfile, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting the table
subsetpower <- subset(power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plotting #1
hist(as.numeric(subsetpower$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()
