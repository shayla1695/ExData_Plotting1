my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sub_data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))
sub_data_date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_data_date), sub_data$Time)
sub_data_date_time <- as.POSIXct(datetime)

png(filename = "plot3.png", width = 480, height = 480)
with(sub_data, plot(sub_data_date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meeting"))
with(sub_data, points(sub_data_date_time, Sub_metering_2, type = "l", col = "red"))
with(sub_data, points(sub_data_date_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, cex = 0.7, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()