f <- read.table("hpc.txt",header=TRUE,sep=";",colClasses="character")
f$Date <- as.Date(f$Date,"%d/%m/%Y")
elec <- subset(f,f$Date=="2007-02-01" | f$Date=="2007-02-02")
plot(as.numeric(elec$Sub_metering_1),xaxt="n",type = "l",col="black",
     ylab = "Energy sub metering",xlab="")
lines(as.numeric(elec$Sub_metering_2),type = "l",col="red")
lines(as.numeric(elec$Sub_metering_3),type = "l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))