setwd("C:/Users/csheffler/OneDrive/Courses/DSC_ExploratoryDataAnalysis")
file = "household_power_consumption.txt"
data <- read.table(file, sep=";",header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
df <- data[data$Date == c("2007-02-01","2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

par(mfrow=c(1,1))

hist(df$Global_active_power, main = "Global Active Power", col="red"
      , xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

