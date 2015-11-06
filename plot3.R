columnclasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data <-read.csv(file="household_power_consumption.txt",sep=";",colClasses=columnclasses,na.strings="?")
febdata <-data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
febdatabackup <-febdata
rm(data)
gc()
febdata$Date <-strptime(paste(febdata$Date,febdata$Time),"%d/%m/%Y %H:%M:%S")
febdata$Time <- NULL
png(filename = "plot3.png")

with (febdata, {
    plot(Date, Sub_metering_1, type = "n",ylab="Energy sub meeting",xlab="")
    points(Date, Sub_metering_1, col="black",type = "l")
    points(Date, Sub_metering_2, col="red",type = "l")
    points(Date, Sub_metering_3, col="blue",type = "l")
    legend("topright",lty ="solid", lwd=1, col = c("black", "red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  }
)

dev.off()