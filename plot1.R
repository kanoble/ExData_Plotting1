## PLOT1.R

## This script generates the plot1.png for in the 
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

## Convert Global Active Power to Numeric Class
df$Global_active_power <- as.numeric(paste(df$Global_active_power))

## Initiate the PNG parameters.
png(filename = "plot1.png",
    width = 480,
    height = 480)

## Generate the histogram plot with appropriate parameters.
hist(df$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

## Turn off the plotting device.
dev.off()