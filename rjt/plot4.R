f <- read.table("hpc.txt",header=TRUE,sep=";",colClasses="character")
f$Date <- as.Date(f$Date,"%d/%m/%Y")
elec <- subset(f,f$Date=="2007-02-01" | f$Date=="2007-02-02")
library(lubridate)
elecTime <- hms(elec$Time)
elecDate <- ymd(elec$Date)
elec$Global_active_power <- as.numeric(elec$Global_active_power)
datime <- elecDate+elecTime
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(elec,plot(datime,Global_active_power,type="l",
               ylab="Global Active Power (kilowatts)",xlab=""))
with(elec,plot(datime,Voltage,type="l",ylab="Voltage",xlab="datetime"))
plot(as.numeric(elec$Sub_metering_1),xaxt="n",type = "l",col="black",
     ylab = "Energy sub metering",xlab="")
lines(as.numeric(elec$Sub_metering_2),type = "l",col="red")
lines(as.numeric(elec$Sub_metering_3),type = "l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
with(elec,plot(datime,Global_reactive_power,type="l",
               ylab="Global_reactive_power",xlab="datetime"))