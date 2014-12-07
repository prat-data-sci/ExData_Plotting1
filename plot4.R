# We will be using the "Individual household electric power consumption Data Set" 
# Description: Measurements of electric power consumption in one household with a one-minute sampling rate 
# over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

# The dataset has 2,075,259 rows and 9 columns. Approx 140MB memory will be required in memory 
# before reading into R.

# The overall goal here is simply to examine how household energy usage varies over a 2-day period 
# in February, 2007. The task is to reconstruct 4 plots using the base plotting system.
# This code will generate the plot4.png file with plots 

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
## with(my_dt, plot(Date,as.numeric(Sub_metering_1),ylab = "Energy sub metering"))


par(mfrow=c(2,2))
par(mar=c(3,5,3,3))

## First Plot
# generate the empty plot
with(my_dt,plot(Date,Global_active_power,type="n",xlab=""))
# Add lines
with(my_dt, lines(Date,Global_active_power,ylab = "Global Active Power (kilowatts)"))


## Second Plot
# generate the empty plot
with(my_dt,plot(Date,Voltage,type="n",xlab=""))
# Add lines
with(my_dt, lines(Date,Voltage,ylab = "Voltage"))

## Third Plot
# new empty plot
with(my_dt, plot(Date, as.numeric(Sub_metering_1),xlab="",ylab = "Energy sub metering",type="n"))

# Add lines
with(my_dt, lines(Date, as.numeric(Sub_metering_1), col="black"))
with(my_dt, lines(Date, as.numeric(Sub_metering_2), col="red"))
with(my_dt, lines(Date, as.numeric(Sub_metering_3), col="blue"))

# Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c('black','red','blue'),lty=1,lwd=1.5) 


## Fourth Plot
# generate the empty plot
with(my_dt,plot(Date,Global_reactive_power,type="n",xlab=""))
# Add lines
with(my_dt, lines(Date,Global_reactive_power,ylab = "Global Reactive Power"))

par("mar")

# copy to png file
dev.copy(png,file="plot4.png")
dev.off()


