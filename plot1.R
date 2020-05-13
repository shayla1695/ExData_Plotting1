my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sub_data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))
sub_data_date <- as.Date(sub_data$Date, format="%d/%m/%Y")

png(filename = "plot1.png", width = 480, height = 480)
hist(sub_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
