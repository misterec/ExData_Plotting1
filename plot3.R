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
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

# Call `plot` function to construct an empty plot
plot(dt$Datetime,  dt$Sub_metering_1, xlab = "", ylab = "Energy Sub Metering",
     type = "n")

# Add the actual data with `lines` function
lines(dt$Datetime, dt$Sub_metering_1, col = "black")
lines(dt$Datetime ,dt$Sub_metering_2, col = "red")
lines(dt$Datetime ,dt$Sub_metering_3, col = "blue")

# Add the legend for the plot
legend("topright", lty = "solid", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the graphic device
dev.off()
