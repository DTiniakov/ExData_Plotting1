file.create('HHPC')
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'HHPC')
data<-read.table(unz('HHPC','household_power_consumption.txt'), header=TRUE, sep=';', na.strings='?', nrows=70000)

data$Date<-as.Date(data$Date, '%d/%m/%Y') 

data$Time<-paste(data$Date, data$Time)
data$Time<-strptime(data$Time, '%Y-%m-%d %H:%M:%S')

hhpc<-subset(data, Date=='2007-02-01'|Date=='2007-02-02')#getting data for 01-02/02/2007 with date/time as date/time classes
hhpc[c(1, nrow(hhpc)),]



# plot3 ####
Sys.setlocale("LC_ALL", "English")
with(hhpc, plot(Time, Sub_metering_1, type='l', ylab='Energy sub metering', xlab=''))
with(hhpc, lines(Time, Sub_metering_2, col='red'))
with(hhpc, lines(Time, Sub_metering_3, col='blue'))
legend('topright', lty=1, col= c('black','red','blue'), c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), cex = 0.75)
dev.copy(png, file='plot3.png', width=480, height = 480)
dev.off()
