# Read from the text file
my_df <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
my_df_sub <- subset(my_df,my_df$Date == "1/2/2007" | my_df$Date == "2/2/2007")

df <- my_df_sub

# Convert the Date and Time variables to Date/Time classes 
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time), format="%Y-%m-%d %H:%M:%S")

# Plot the 4 panels
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

# plot panel 1 -- Time vs Global_active_power
plot(df$Time,df$Global_active_power,type='l',ylab='Global Active Power(kilowatts)',xlab='')

# plot panel 2 -- Time vs Voltage
plot(df$Time,df$Voltage,type='l',xlab='datetime',ylab='Voltage')

# plot panel 3 -- Time vs Energy_Sub_Metering (1,2 & 3) variables
plot(df$Time, df$Sub_metering_1,ylab='Energy sub metering',xlab='',type="l")
lines(df$Time,df$Sub_metering_2,col='red')
lines(df$Time,df$Sub_metering_3,col='blue')
legend('topright',lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

# plot panel 4 -- Time vs Global_reactive_power
plot(df$Time,df$Global_reactive_power,type='l',xlab='datetime',ylab='Global reactive power')

dev.off()
