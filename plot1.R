library(lubridate)


power_consumption <- read.csv("project-1/data/household_power_consumption.txt",sep=";", na.strings="?")
power_consumption$timestamp <- strptime(paste(power_consumption$Date, power_consumption$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

# filter for data between 2007-02-01 and 2007-02-02 and also ensure we don't pull up null timestamps
power_consumption_subset <-  power_consumption[power_consumption$timestamp >= '2007-02-01 00:00:00' & power_consumption$timestamp <= '2007-02-02 23:59:59' & !is.na(power_consumption$timestamp ),]

# create the png file in the figure directory. It is assumed that this directory exists
if (!file.exists("./figure"))
{
        dir.create("./figure")
}
png(file="./figure/plot1.png");
hist(power_consumption_subset$Global_active_power, col="red", xlab = "Global Active Power(kilowatts)", main="Global Active Power")
dev.off();
