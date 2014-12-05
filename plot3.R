png(file="./figure/plot3.png");
plot(range(power_consumption_subset$timestamp),range(power_consumption_subset$Sub_metering_1, power_consumption_subset$Sub_metering_2,power_consumption_subset$Sub_metering_3),type='n',ylab = "Energy sub metering", xlab = "")
lines(power_consumption_subset$timestamp,power_consumption_subset$Sub_metering_1, type="l")
lines(power_consumption_subset$timestamp,power_consumption_subset$Sub_metering_2, type="l", col="red")
lines(power_consumption_subset$timestamp,power_consumption_subset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()