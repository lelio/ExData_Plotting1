plot1 <- function() {
  alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  data<-subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")
  datecol<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
  newdata<-data.frame(datecol,data[,3:9])
  png(file="plot1.png",width=480,height=480)
  hist(newdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.off()
}