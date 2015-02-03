
# roughly caculation of memory need:
# 2075259*9*8/2^20  #142.4967mb
#load data
ini<-read.table('household_power_consumption.txt',nrow=20,header=T,sep=';')
classes<-sapply(ini,class)
fl<-file('household_power_consumption.txt')
datas <- read.table(text = grep("^[1,2]/2/2007", readLines(fl), value = T),
                    sep=';',na.strings='?',
                    colClasses=classes,
                    header=F,
                    col.names=names(ini))

library(lubridate)
Sys.setlocale("LC_TIME", "en_US.UTF-8")
date<-dmy_hms(paste(datas$Date,datas$Time))

#figure 3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
plot(date,datas$Sub_metering_1,type='l',
     ylab='Energy sub metering',xlab='')
lines(date,datas$Sub_metering_2,type='l',
      ylab='Global Active Power(kilowatts)',col='red')
lines(date,datas$Sub_metering_3,type='l',
      ylab='Global Active Power(kilowatts)',col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1,
       col=c('black','red','blue'))
dev.off()