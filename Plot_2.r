library('dplyr')
# reading data
archivo<- read.table("C:/Users/Usuario/Documents/data_sharing/data/household_power_consumption.txt",sep=";",
                     header = TRUE)
# plot 2
archivo$Date<- as.Date(archivo$Date,,format="%d/%m/%Y")
archivo1<- filter(archivo,Date==c('2007-02-01','2007-02-02'))
archivo1$Time<- strptime(archivo1$Time)
archivo1$Global_active_power<-as.numeric(archivo1$Global_active_power)
archivo1$week<- format(as.Date(archivo1$Date),"%A")
datetime <- paste(as.Date(archivo1$Date), archivo1$Time)
archivo1$Datetime <- as.POSIXct(datetime)
# temporal serie
plot(archivo1$Global_active_power~archivo1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
# saving_file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()