png(file="./project-1/figure/plot4.png");

# set the mfrow parameter for 2x2 plots to include all of the plot thus far..
par(mfrow=c(2,2))

plot(power_consumption_subset$timestamp,power_consumption_subset$Global_active_power, type="l", ylab = "Global Active Power", xlab = "" )


plot(power_consumption_subset$timestamp,power_consumption_subset$Voltage, type="l", ylab = "Voltage", xlab = "datetime" )


plot(range(power_consumption_subset$timestamp),range(power_consumption_subset$Sub_metering_1, power_consumption_subset$Sub_metering_2,power_consumption_subset$Sub_metering_3),type='n',ylab = "Energy sub metering", xlab = "")
lines(power_consumption_subset$timestamp,power_consumption_subset$Sub_metering_1, type="l")
lines(power_consumption_subset$timestamp,power_consumption_subset$Sub_metering_2, type="l", col="red")
lines(power_consumption_subset$timestamp,power_consumption_subset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))



plot(power_consumption_subset$timestamp,power_consumption_subset$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime" )

dev.off()

