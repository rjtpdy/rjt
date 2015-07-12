f <- read.table("hpc.txt",header=TRUE,sep=";",colClasses="character")
library(lubridate)
f$Date <- as.Date(f$Date,"%d/%m/%Y")
elec <- subset(f,f$Date=="2007-02-01" | f$Date=="2007-02-02")
elecTime <- hms(elec$Time)
elecDate <- ymd(elec$Date)
elec$Global_active_power <- as.numeric(elec$Global_active_power)
datime <- elecDate+elecTime
with(elec,plot(datime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))