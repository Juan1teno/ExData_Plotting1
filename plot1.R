# Plot 1

# load file into function
hpc <- "household_power_consumption.txt"

# set column names
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )

# read file from the function
hpc <- read.table(fn, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

# convert to Date type d/m/y, then select 2007-02-01 and 2007-02-02
hpc$date = as.Date(hpc$date, format="%d/%m/%Y")
hpc = hpc[hpc$date >= as.Date("2007-02-01") & hpc$date<=as.Date("2007-02-02"),]

# make plot and save plot1.png
png(filename="plot1.png", width=480, height=480, units="px")
hist(hpc$globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

