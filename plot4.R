# Load the data
data <- read.csv2("./R/EAD/household_power_consumption.txt", na.strings = "?",
                  nrows = 69600, stringsAsFactors = FALSE)
data$Datetime <- strptime(paste(data$Date, data$Time, " "), 
                          format = "%d/%m/%Y %H:%M:%S")
data[,1] <- as.Date(data[, 1], format = "%d/%m/%Y")
data[,3] <- as.numeric(data[, 3])

# Subset data for the period of time 2007-02-01 and 2007-02-02
dt <- subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")

# Open the graphic device
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

# Set `mfrow` parameter to create a graphic with 2 rows and 2 columns
par(mfrow = c(2, 2))

# Plot an upper-left graphic
plot(dt$Datetime, dt$Global_active_power, xlab = "", 
     ylab = "Global Active Power", type = "l")

# Plot an upper-right graphic
plot(dt$Datetime, dt$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Plot a lower-left graphic
plot(dt$Datetime,  dt$Sub_metering_1, xlab = "", ylab = "Energy Sub Metering",
     type = "n")
lines(dt$Datetime, dt$Sub_metering_1, col = "black")
lines(dt$Datetime ,dt$Sub_metering_2, col = "red")
lines(dt$Datetime ,dt$Sub_metering_3, col = "blue")
legend("topright", lty = "solid", bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot an lower-right graphic
plot(dt$Datetime, dt$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_active_power", type = "l")

# Close the graphic device
dev.off()
