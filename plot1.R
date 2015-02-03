
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
#figure1
library(lubridate)
Sys.setlocale("LC_TIME", "en_US.UTF-8")
date<-dmy_hms(paste(datas$Date,datas$Time))

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(datas$Global_active_power,col='red',
     main='Global Active Power',
     xlab='Global Active Power(kilowatts)')
dev.off()
