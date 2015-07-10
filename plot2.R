#plot 2
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
png(filename = "plot2.png", width = 480, height = 480, units="px")
plot(d$DateTime, d$Global_active_power, type="l", #draw lines
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
