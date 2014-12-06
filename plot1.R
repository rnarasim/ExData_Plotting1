library(lubridate)
library(data.table)
# assumes unzipped txt file lives in a folder project-1/data..


if (!file.exists("./project-1/data))
{
        dir.create("./project-1/data/")
}

if (!file.exists("./project-1/figure))
{
        dir.create("./project-1/figure/")
}

# download the zip file that has the data to data directory
download.file ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="./project-1/data", method="curl")

# unzip the file to data directory
unzip ("./project-1/data/household_power_consumption.zip",exdir="./project-1/data",overwrite=TRUE)
power_consumption <- read.table("project-1/data/household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")
power_consumption$timestamp <- strptime(paste(power_consumption$Date, power_consumption$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

# filter for data between 2007-02-01 and 2007-02-02 
# Note: there are 240 observations in the dataset that happen during DST switch so times betwen 2:00 am and 2:59 am are null
# you can find those dates here http://wwp.greenwichmeantime.com/daylight-saving-time/usa/dst-2007.htm
# also ensure we don't pull up null timestamps
power_consumption_subset <-  power_consumption[power_consumption$timestamp >= '2007-02-01 00:00:00' & power_consumption$timestamp <= '2007-02-02 23:59:59' & !is.na(power_consumption$timestamp ),]


png(file="./project-1/figure/plot1.png");
hist(power_consumption_subset$Global_active_power, col="red", xlab = "Global Active Power(kilowatts)", main="Global Active Power")
dev.off();
