##Coursera Exploratory Data Analysis: Course Project 1
##Sam Howell
##Script for exploratory plots

#Set the correct working directory
setwd("/Users/samhowell/Documents/")

#Import the data using the correct seperator, headers and decimnal symbol
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#Check the imported data
str(data)
head(data)

#Set the date in a DATE format and change the 
data$dateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#Subset the data to the two dates prescribed in the assignment
dataSubset <- subset(data, data$Date=="2007-02-01" | data$Date =="2007-02-02")

#Sanity check the data we will work with
head(dataSubset)
tail(dataSubset)
summary(dataSubset)
str(dataSubset)

#Fourth Plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Top Left Plot
plot(dataSubset$dateTime, dataSubset$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
#Top Right Plot
plot(dataSubset$dateTime, dataSubset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#Bottom Left Plot
plot(dataSubset$dateTime, dataSubset$Sub_metering_1, type = "l", ylab = "Global Active Power", xlab = "")
lines(dataSubset$dateTime, dataSubset$Sub_metering_2, col = "Red")
lines(dataSubset$dateTime, dataSubset$Sub_metering_3, col = "Blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("Black", "Red", "Blue"),bty = "n")
#Bottom Right Plot
plot(dataSubset$dateTime, dataSubset$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()