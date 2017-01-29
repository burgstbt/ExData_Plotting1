# Read from Unzipped file only relevant lines
df <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", dec = ".", skip = 66637, nrows = 2880)

# Read and assign headers
header <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", nrows = 1)
names(df) <- names(header)

# set up and print plot
par(mfrow = c(1, 1))
xlab <- ""
ylab <- "Global Active Power (kilowatts)"
plot(1:length(df$Date), df$Global_active_power, type = "l", ylab = ylab, xlab = xlab, xaxt = "n")

axis(1, at = c(1, length(df$Date)/2, length(df$Date)), labels=c("Thu", "Fri", "Sat"))


# Write plot image to file
dev.copy(png, "plot2.png", width = 640, height = 640)

# close device
dev.off()