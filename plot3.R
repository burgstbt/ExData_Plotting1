# Read from Unzipped file only relevant lines
df <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", dec = ".", skip = 66637, nrows = 2880)

# Read and assign headers
header <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", nrows = 1)
names(df) <- names(header)


# print base plot
par(mfrow = c(1, 1))
xlab <- ""
ylab <- "Energy sub metering"
plot(1:length(df$Date), df$Sub_metering_1, xaxt = "n", type= "n", xlab = xlab, ylab = ylab)
axis(1, at = c(1, length(df$Date)/2, length(df$Date)), labels=c("Thu", "Fri", "Sat"))

# print content
points(1:length(df$Date), df$Sub_metering_1, type = "l")
points(1:length(df$Date), df$Sub_metering_2, type = "l", col="red")
points(1:length(df$Date), df$Sub_metering_3, type = "l", col="blue")

# print legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c(names(df[7:9])))


# Write plot image to file
dev.copy(png, "plot3.png", width = 640, height = 640)

# close device
dev.off()