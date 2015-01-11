# Read from the text file
my_df <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
my_df_sub <- subset(my_df,my_df$Date == "1/2/2007" | my_df$Date == "2/2/2007")

df <- my_df_sub

# Convert the Date and Time variables to Date/Time classes 
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time), format="%Y-%m-%d %H:%M:%S")

# Plot Time vs Global_active_power variable
png("plot2.png",width = 480, height = 480)
with(df$Time, df$Global_active_power,ylab='Global Active Power(kilowatts)',xlab='',type="l")
dev.off()
