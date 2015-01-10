# PLOT 2
Sys.setlocale("LC_TIME", "C")
Sys.setenv(LANG = "en")
URL      <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "household_power_consumption.zip"
download.file(URL, destfile)
unzip("household_power_consumption.zip", "household_power_consumption.txt")
png(file="plot2.png", height=480, width=480)
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', 
                      na.strings="?", nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()