
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

#Plot the global active power and datetime to see power consumption during 48 hour period
plot(y=subPower$Global_active_power, x=subPower$DateTime, 
     type="l",ylab="Global Active Power (kilowats)",xlab="")