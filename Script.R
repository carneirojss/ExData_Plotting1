#First you will need to fork and clone the following GitHub repository
Data<-read.table("household_power_consumption.txt", header = T,
               sep=";", comment.char="%", 
               stringsAsFactors=FALSE, na.strings="?")
Data

dim(Data)
DateGraph<- subset(Data,Data$Date=="1/2/2007"|Data$Date=="2/2/2007")
DateTime <- strptime(paste(DateGraph$Date, DateGraph$Time,
                      sep=" "), "%d/%m/%Y %H:%M:%S")


plot1 <- function() {
  hist(DateGraph$Global_active_power,col="red",
       xlab="Global Active Power(kilowatts)",
       main="Global Active Power")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}
plot1()

plot2 <- function() {
  plot(DateTime,DateGraph$Global_active_power,
       ylab="Global Active Power(kilowatts)",
       xlab="",type="l")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}
plot2()
plot3 <- function() {
  plot(DateTime,DateGraph$Sub_metering_1,type="n",xlab = "",
       ylab="Energy sub metering")
  lines(DateTime,DateGraph$Sub_metering_1,col="black")
  lines(DateTime,DateGraph$Sub_metering_2,col="red")
  lines(DateTime,DateGraph$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
         legend=c("Sub_meeting_1","Sub_meeting_2"
                             ,"Sub_meeting_3"))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
}
plot3()
windows()
par(mfrow=c(2,2))
plot4<-function(){
  plot(DateTime,DateGraph$Global_active_power,
       ylab="Global Active Power",
       xlab="",type="l")
  plot(DateTime,DateGraph$Voltage,ylab="Voltage",type="l")
  plot(DateTime,DateGraph$Sub_metering_1,type="n",xlab = "",
       ylab="Energy sub metering")
  lines(DateTime,DateGraph$Sub_metering_1,col="black")
  lines(DateTime,DateGraph$Sub_metering_2,col="red")
  lines(DateTime,DateGraph$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
         legend=c("Sub_meeting_1","Sub_meeting_2"
                                 ,"Sub_meeting_3"))
  plot(DateTime,DateGraph$Global_reactive_power,
       type="l",ylab="Global_reactive_power")
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
}
plot4()

