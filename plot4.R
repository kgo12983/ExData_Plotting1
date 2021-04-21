# Load File and Edit Object Class

df <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df <- df[df$Date == as.Date('2007-02-01') |df$Date == as.Date('2007-02-02'),]

df <- within(df, { timestamp = strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S")})

#Plot 4
png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting1/plot4.png",
    width=480, height=480)
par(mfrow=c(2,2))
with(df,plot(timestamp, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l"))

with(df,plot(timestamp, Voltage, xlab="datetime", ylab="Voltage", type = "l"))

with(df, plot(timestamp, Sub_metering_1, xlab="", ylab= "Energy sub metering", col = "black", type = "l"))
with(df, points(timestamp, Sub_metering_2, col = "blue", type = "l"))
with(df, points(timestamp, Sub_metering_3, col = "red", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty=1)

with(df,plot(timestamp, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l"))
dev.off()