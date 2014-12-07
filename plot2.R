# We will be using the "Individual household electric power consumption Data Set" 
# Description: Measurements of electric power consumption in one household with a one-minute sampling rate 
# over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

# The dataset has 2,075,259 rows and 9 columns. Approx 140MB memory will be required in memory 
# before reading into R.

# The overall goal here is simply to examine how household energy usage varies over a 2-day period 
# in February, 2007. The task is to reconstruct 4 plots using the base plotting system.
# This code will generate the plot2.png file 

# Load the dplyr, lubridate, datasets packages of R
library(dplyr)
library(lubridate)
library(datsets)

# Read from the text file
my_dataset <- read.table("household_power_consumption.txt", sep=";",header=TRUE)

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
my_dataset_sub <- subset(my_dataset,my_dataset$Date == "1/2/2007" | my_dataset$Date == "2/2/2007")

# Use data table
my_dt <- tbl_df(my_dataset_sub)

# Set the Date to DateTime class
my_dt$Date <- dmy(my_dt$Date)
my_dt$Date <- as.POSIXct(paste(my_dt$Date, my_dt$Time))

# generate the hist for Global active power on screen
with(my_dt,plot(Date,Global_active_power,type="n",xlab=""))
# lines(Date,Global_active_power,ylab = "Global Active Power (kilowatts)")
with(my_dt, lines(Date,Global_active_power,ylab = "Global Active Power (kilowatts)"))

# copy to png file
dev.copy(png,file="plot2.png")
dev.off()

