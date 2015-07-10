#plot 3

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
png(filename = "plot3.png", width = 480, height = 480, units="px")
#Plot 1st line
plot(d$DateTime, d$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
#plot 2nd line
lines(d$DateTime, d$Sub_metering_2, col="red")
#Plot 3rd line
lines(d$DateTime, d$Sub_metering_3, col="blue")
#add legend
legend("topright", lty=c(1,1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
