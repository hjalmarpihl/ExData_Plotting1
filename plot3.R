# This code reads the household power consumption data, produces Plot 3, and saves it as a .png file.

# Reading the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Encoding date and time variables 
data$Time<-paste(data$Date, data$Time)
data$Time<-strptime(data$Time , "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
# Keeping only the relevant dates
data<-data[data$Date==as.Date("2007/02/01") | data$Date==as.Date("2007/02/02"),]

# Make plot 3
par(mfrow=c(1,1))

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

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.7, pt.cex=1)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()