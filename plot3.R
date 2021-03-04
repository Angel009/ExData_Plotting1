##R file for plot 3
###############################################
#reading file and storing data
consumption_file <- "household_power_consumption.txt"
data <- read.table(consumption_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting data for specific date
dated_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
time_date <- strptime(paste(dated_data$Date, dated_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#formatting data for plot 3
activepower <- as.numeric(dated_data$Global_active_power)
subMetering1 <- as.numeric(dated_data$Sub_metering_1)
subMetering2 <- as.numeric(dated_data$Sub_metering_2)
subMetering3 <- as.numeric(dated_data$Sub_metering_3)

#creation of png file
png("plot3.png", width=480, height=480)

#plot structure
plot(time_date, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(time_date, subMetering2, type="l", col="red")
lines(time_date, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()