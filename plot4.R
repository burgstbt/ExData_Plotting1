# Read from Unzipped file only relevant lines
df <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", dec = ".", skip = 66637, nrows = 2880)

# Read and assign headers
header <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", nrows = 1)
names(df) <- names(header)

# set up plotting area
par(mfrow = c(2, 2))

# plot top left tile
xlab <- ""
ylab <- "Global Active Power"
plot(1:length(df$Date), df$Global_active_power, type = "l", ylab = ylab, xlab = xlab, xaxt = "n")
axis(1, at = c(1, length(df$Date)/2, length(df$Date)), labels=c("Thu", "Fri", "Sat"))


# plot top right tile
xlab <- "datetime"
ylab <- "Voltage"
plot(1:length(df$Date), df$Voltage, type = "l", xlab = xlab, ylab = ylab, xaxt = "n")
axis(1, at = c(1, length(df$Date)/2, length(df$Date)), labels=c("Thu", "Fri", "Sat"))


# plot bottom left tile
xlab <- ""
ylab <- "Energy sub metering"
plot(cbind(1:length(df$Date), df$Sub_metering_1), xaxt = "n", type= "n", xlab = xlab, ylab = ylab)
axis(1, at = c(1, length(df$Date)/2, length(df$Date)), labels=c("Thu", "Fri", "Sat"))

# plot content of bottom left tile
points(1:length(df$Date), df$Sub_metering_1, type = "l")
points(1:length(df$Date), df$Sub_metering_2, type = "l", col="red")
points(1:length(df$Date), df$Sub_metering_3, type = "l", col="blue")

# plot legend of bottom left tile
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c(names(df[7:9])), bty =  "n")


# plot bottom right tile
xlab <- "datetime"
ylab <- names(df[4])
plot(1:length(df$Date), df$Global_reactive_power, type = "l", xlab = xlab, ylab = ylab, xaxt = "n")
axis(1, at = c(1, length(df$Date)/2, length(df$Date)), labels=c("Thu", "Fri", "Sat"))


# Write plot image to file
dev.copy(png, "plot4.png", width = 640, height = 640)

# close device
dev.off()