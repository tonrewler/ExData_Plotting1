setwd("C:/Users/csheffler/OneDrive/Courses/DSC_ExploratoryDataAnalysis")
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
df <- data[data$Date == c("2007-02-01","2007-02-02"),]

# Set plot area to show 2 by 2 
par(mfrow = c(2,2))

# Create plot 1
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(df$timestamp,df$Global_active_power, type="l", xlab=""
     , ylab="Global Active Power")


# Create plot 2
df$Voltage <- as.numeric(as.character(df$Voltage))
plot(df$timestamp,df$Voltage, type="l", xlab="datetime"
     , ylab="Voltage")


# Create plot 3
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

plot(df$timestamp,df$Sub_metering_1, type="l", xlab="datetime"
     , ylab="Energy sub metering")

lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1 ","Sub_metering_2", "Sub_metering_3")
       ,lty=c(1,1), lwd=c(1,1))


# Create plot 4
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime"
     , ylab="Global_reactive_power")


# Save plot
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()


