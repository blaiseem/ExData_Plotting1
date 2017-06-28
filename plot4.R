setwd("C:\\Users\\bem9\\Google Drive\\Documents 2016 -\\Education\\Coursera Data Science\\04 Exploratory Data Analytics\\Week 1\\Assignment\\ExData_Plotting1")

data <- read.table("household_power_consumption.txt", nrows=100000, header=TRUE,
                   sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(data, {
    plot(data$DateTime, data$Global_active_power, type="l", col="black", main="", xlab="", ylab="Global Active Power")
    plot(data$DateTime, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
    plot(data$DateTime, data$Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="l", col="black")
    points(data$DateTime, data$Sub_metering_2, type="l", col="red")
    points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), 
           lwd=1, col=c("black", "red", "blue"), bty="n")
    plot(data$DateTime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l", col="black")
    
    
})



dev.off()