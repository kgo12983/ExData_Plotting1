# Load File and Edit Object Class

df <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df <- df[df$Date == as.Date('2007-02-01') |df$Date == as.Date('2007-02-02'),]

df <- within(df, { timestamp = strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S")})


#Plot 1

png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting1/plot1.png",
    width=480, height=480)

with(df,hist(Global_active_power, main = "Global Active Power", 
xlab= "Global Active Power (kilowatts)", col = "red"))
dev.off()