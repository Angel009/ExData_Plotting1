##R file for plot 2
#########################################################
#reading file and storing data
consumption_file <- "household_power_consumption.txt"
data <- read.table(consumption_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting data for specific date
dated_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
time_date <- strptime(paste(dated_data$Date, dated_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#formatting data for plot2
activepower <- as.numeric(dated_data$Global_active_power)

#creation of png file
png("plot2.png", width=480, height=480)

#plot structure
plot(time_date, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()