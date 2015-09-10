## PLOT2.R

## This script generates the plot2.png for in the 
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
df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)

## Create a combined column of the Date and Time columns
df <- mutate(df, Date_Time = paste(Date, Time, sep = " "))
df$Date_Time <- strptime(df$Date_Time, "%d/%m/%Y %H:%M:%S")

## Initiate the PNG parameters.
png(filename = "plot2.png",
    width = 480,
    height = 480)

## Generate the line plot with appropriate parameters.
plot(df$Date_Time, df$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Turn off the plotting device.
dev.off()