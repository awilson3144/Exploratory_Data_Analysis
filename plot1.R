
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

#Create histogram to display frequency of Global Active Power values, create title,
#axis label, and color the plot red

hist(subPower$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main="Global Active Power", col = "red")