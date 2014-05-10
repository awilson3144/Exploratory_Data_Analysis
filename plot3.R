
# Read data from given file in local working directory
power<-read.csv2('household_power_consumption.txt',header = TRUE, as.is = T)

#Missing values are coded as '?'.  They should be removed for this analysis
power[power$Global_active_power=="?",]<-NA
power<-na.omit(power)

#Subset data so that only data points between 2007-02-01 and 2001-02-02 are used
subPower<-subset(power,as.Date(Date, format = "%d/%m/%Y")<="2007-02-02" 
                 & as.Date(Date, format = "%d/%m/%Y")>="2007-02-01")

#Converting Global Active Power field to numeric for displaying in histogram.
subPower$Global_active_power <- 
  as.numeric(type.conver(as.character(subPower$Global_active_power),dec="."))

#Create new field that creates datetime value from 'Date' and 'Time' columns
subPower$DateTime<-strptime(paste(subPower$Date,subPower$Time), format="%d/%m/%Y %H:%M:%S")

#Plot the power consumption from the 3 different submeters
plot(y=subPower$Sub_metering_1, x=subPower$DateTime, type="l",ylab="Energy sub metering",xlab="")
lines(y=subPower$Sub_metering_2, x=subPower$DateTime, type="l",col="red")
lines(y=subPower$Sub_metering_3, x=subPower$DateTime, type="l",col="blue")

#Create legend
legend("topright",lty=.5,col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))