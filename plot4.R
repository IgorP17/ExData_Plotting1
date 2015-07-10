#plot 4

#Path to data file, change it if it is necessary
dataFilePath <- "../../../data/household_power_consumption.txt"

#Read data
data <- read.csv(dataFilePath, sep=";", na.string="?")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),
                          format="%d/%m/%Y %H:%M:%S")

#subset
d <- data[as.Date(data$DateTime) >= as.Date("2007-02-01") &
                  as.Date(data$DateTime) <= as.Date("2007-02-02"), ]

#plot as png with params and save graph
png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
with(d, {
        # 1 - 1
        plot(DateTime, Global_active_power, type="l",
             xlab="", ylab="Global Active Power")
        #1 - 2
        plot(DateTime, Voltage, type="l",
             xlab="datetime", ylab="Voltage")
        #2 - 1
        plot(DateTime, Sub_metering_1, type="l",
             xlab="", ylab="Energy sub metering")
        # add new line
        lines(DateTime, Sub_metering_2, col="red")
        # add new line
        lines(DateTime, Sub_metering_3, col="blue")
        #legend
        legend("topright", cex=0.7, bty="n", lty=c(1,1), col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        #2 - 2
        plot(DateTime, Global_reactive_power, type="l",
             xlab="datetime", ylab="Global_reactive_Power")
})
dev.off()

