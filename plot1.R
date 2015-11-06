columnclasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data <-read.csv(file="household_power_consumption.txt",sep=";",colClasses=columnclasses,na.strings="?")
febdata <-data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
febdatabackup <-febdata
rm(data)
gc()
febdata$Date <-strptime(paste(febdata$Date,febdata$Time),"%d/%m/%Y %H:%M:%S")
febdata$Time <- NULL
png(filename = "plot1.png")
hist(febdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()