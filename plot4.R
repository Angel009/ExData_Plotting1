##R file for plot 4
############################################################
#reading file and storing data
 consumption_file<- "household_power_consumption.txt"
data <- read.table(consumption_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting data for specific date
dated_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
time_date <- strptime(paste(dated_data$Date, dated_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#formatting data for plot 4
activepower <- as.numeric(dated_data$Global_active_power)
reactivepower <- as.numeric(dated_data$Global_reactive_power)
voltage <- as.numeric(dated_data$Voltage)
submeter1 <- as.numeric(dated_data$Sub_metering_1)
submeter2 <- as.numeric(dated_data$Sub_metering_2)
submeter3 <- as.numeric(dated_data$Sub_metering_3)

#creation of png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot structure
plot(time_date, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(time_date, voltage, type="l", xlab="time_date", ylab="Voltage")
plot(time_date, submeter1, type="l", ylab="Energy submeter", xlab="")

lines(time_date, submeter2, type="l", col="red")
lines(time_date, submeter3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(time_date, reactivepower, type="l", xlab="time_date", ylab="Global_reactive_power")
dev.off()
