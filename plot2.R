png(file="./figure/plot2.png");
plot(power_consumption_subset$timestamp,power_consumption_subset$Global_active_power, type="l", ylab = "Global Active Power(kilowatts)", xlab = "" )
dev.off()