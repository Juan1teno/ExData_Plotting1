# Plot 4

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

# make plot and save plot4.png
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

# #1
plot(hpc$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(hpc)/2), nrow(hpc)), labels=c("Thu", "Fri", "Sat"))

# #2
plot(hpc$voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(hpc)/2), nrow(hpc)), labels=c("Thu", "Fri", "Sat"))


# #3
with(hpc, {
    plot(subMetering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
    lines(x=subMetering2, col="red")
    lines(x=subMetering3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(hpc)/2), nrow(hpc)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

# #4
plot(hpc$globalReactivePower, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(hpc)/2), nrow(hpc)), labels=c("Thu", "Fri", "Sat"))

dev.off()