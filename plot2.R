setwd("C:/Users/csheffler/OneDrive/Courses/DSC_ExploratoryDataAnalysis")
file = "household_power_consumption.txt"
data <- read.table(file, sep=";",header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
df <- data[data$Date == c("2007-02-01","2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))

plot(df$timestamp,df$Global_active_power, type="l", xlab=""
        , ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

