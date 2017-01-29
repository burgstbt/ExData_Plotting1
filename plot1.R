# Read from Unzipped file only relevant lines
df <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", dec = ".", skip = 66637, nrows = 2880)

#Read and assign headers
header <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", nrows = 1)
names(df) <- names(header)

# Show histogramm in red with appropriate title and axis labels
par(mfrow = c(1, 1))
xlab <- "Global Active Power (kilowatts)"
main <- "Global Active Power"
hist(df$Global_active_power, col = "red", xlab = xlab, main = main)

# Write plot image to file
dev.copy(png, "plot1.png", width = 640, height = 640)

# close device
dev.off()