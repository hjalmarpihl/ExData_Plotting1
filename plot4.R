# This code reads the household power consumption data, produces Plot 4, and saves it as a .png file.

# Reading the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Encoding date and time variables 
data$Time<-paste(data$Date, data$Time)
data$Time<-strptime(data$Time , "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
# Keeping only the relevant dates
data<-data[data$Date==as.Date("2007/02/01") | data$Date==as.Date("2007/02/02"),]

# Make plot 4
par(mfrow=c(2,2), cex=0.5)

with(data, plot(Time, Global_active_power, 
                type="l", 
                ylab="Global Active Power",
                xlab=""))

with(data, plot(Time, Voltage, 
                type="l", 
                ylab="Voltage",
                xlab="datetime"))

with(data, plot(Time, Sub_metering_1,
                type="l",
                ylab="Energy sub metering",
                xlab=""))

with(data, points(Time, Sub_metering_2, 
                  col="red",
                  type="l"))

with(data, points(Time, Sub_metering_3, 
                  col="blue",
                  type="l"))

legend("topright", lty=1, col=c("black","red","blue"), legend=names(data)[7:9], bty="n")

with(data, plot(Time, Global_reactive_power, 
                xlab="datetime",
                type="l"))


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()