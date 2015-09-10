## PLOT3.R

## This script generates the plot3.png for in the 
## Exploratory Data Analysis course project one.

require(dplyr)

## Read in the analysis file.
df <- read.table("household_power_consumption.txt", 
                 sep = ";", 
                 header = TRUE)

## Set the dates to use for the analysis.
dates <- c("1/2/2007", "2/2/2007")

## Subset the data frame by only the required dates.
df <- filter(df, Date %in% dates)

## Convert column classes for plotting and analysis
df$Global_active_power <- as.numeric(paste(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(paste(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(paste(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(paste(df$Sub_metering_3))
df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)

## Create a combined column of the Date and Time columns
df <- mutate(df, Date_Time = paste(Date, Time, sep = " "))
df$Date_Time <- strptime(df$Date_Time, "%d/%m/%Y %H:%M:%S")

## Initiate the PNG parameters.
png(filename = "plot3.png",
    width = 480,
    height = 480)

## Generate the line plot with appropriate parameters.
plot(df$Date_Time, df$Sub_metering_1, 
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(df$Date_Time, df$Sub_metering_1)
lines(df$Date_Time, df$Sub_metering_2, col = "red")
lines(df$Date_Time, df$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = 1)

## Turn off the plotting device.
dev.off()
