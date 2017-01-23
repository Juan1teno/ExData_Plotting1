# Plot 2

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

# make plot and save plot2.png
png(filename="plot2.png", width=480, height=480, units="px")
plot(hpc$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(hpc)/2), nrow(hpc)), labels=c("Thu", "Fri", "Sat"))
dev.off()
