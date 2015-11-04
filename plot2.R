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
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")

# Call `plot` function to construct a plot
plot(dt$Datetime, dt$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

# Close the graphic device
dev.off()

