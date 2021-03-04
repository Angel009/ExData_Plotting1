##R file for plot 1
################################################
#reading file and storing data
consumption_file <- "household_power_consumption.txt"
data <- read.table(consumption_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting data for specific date
dated_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#formatting data for plot1
activepower <- as.numeric(dated_data$Global_active_power)

#creation of png file
png("plot1.png", width=480, height=480)

#plot structure
hist(activepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()