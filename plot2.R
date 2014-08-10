plot2 <- function() {
  alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  data<-subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")
  datecol<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
  newdata<-data.frame(datecol,data[,3:9])
  Sys.setlocale(category = "LC_TIME", locale = "C")
  png(file="plot2.png",width=480,height=480)
  plot(newdata$datecol,newdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  dev.off()
  Sys.setlocale(category = "LC_TIME", locale = "")
}