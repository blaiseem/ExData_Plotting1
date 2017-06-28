setwd("C:\\Users\\bem9\\Google Drive\\Documents 2016 -\\Education\\Coursera Data Science\\04 Exploratory Data Analytics\\Week 1\\Assignment\\ExData_Plotting1")

data <- read.table("household_power_consumption.txt", nrows=100000, header=TRUE,
                   sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(data$DateTime, data$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

#hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()