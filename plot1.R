# Load the data
data <- read.csv2("./R/EAD/household_power_consumption.txt", na.strings = "?",
                  nrows = 69600, stringsAsFactors = FALSE)
# Subset data for the period of time 2007-02-01 and 2007-02-02
data[, 1] <- as.Date(data[, 1], format = "%d/%m/%Y")
data[,3] <- as.numeric(data[, 3])
dt <- subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")

# Open the graphic device
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

# Call `hist` function to construct a histogram
hist(dt$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")

# Close the graphic device
dev.off()
