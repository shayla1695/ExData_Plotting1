my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sub_data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))
sub_data_date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_data_date), sub_data$Time)
sub_data_date_time <- as.POSIXct(datetime)


png(filename = "plot2.png", width = 480, height = 480)
with(sub_data, plot(sub_data_date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()