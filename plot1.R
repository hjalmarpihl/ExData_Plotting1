# This code reads the household power consumption data, produces Plot 1, and saves it as a .png file.

# Reading the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Encoding date and time variables 
data$Time<-paste(data$Date, data$Time)
data$Time<-strptime(data$Time , "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
# Keeping only the relevant dates
data<-data[data$Date==as.Date("2007/02/01") | data$Date==as.Date("2007/02/02"),]

# Make plot 1
par(mfrow=c(1,1))

hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()