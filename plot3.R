plot3 <- function() {
  alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  data<-subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")
  datecol<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
  newdata<-data.frame(datecol,data[,3:9])
  Sys.setlocale(category = "LC_TIME", locale = "C")
  png(file="plot3.png",width=480,height=480)
  with(newdata,plot(datecol,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
  with(newdata,lines(datecol,Sub_metering_2,col="red"))
  with(newdata,lines(datecol,Sub_metering_3,col="blue"))
  legend("topright", lty = 1, cex = 0.9, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
  Sys.setlocale(category = "LC_TIME", locale = "")
}