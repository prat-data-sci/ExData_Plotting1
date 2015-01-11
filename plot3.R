# Read from the text file
my_df <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
my_df_sub <- subset(my_df,my_df$Date == "1/2/2007" | my_df$Date == "2/2/2007")

df <- my_df_sub

# Convert the Date and Time variables to Date/Time classes 
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time), format="%Y-%m-%d %H:%M:%S")

# Plot Time vs Energy_Sub_Metering (1,2 & 3) variables
png("plot3.png",width = 480, height = 480)
plot(df$Time, df$Sub_metering_1,ylab='Energy sub metering',xlab='',type="l")
lines(df$Time,df$Sub_metering_2,col='red')
lines(df$Time,df$Sub_metering_3,col='blue')
legend('topright',lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
