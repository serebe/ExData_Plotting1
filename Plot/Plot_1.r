library('dplyr')
# reading data
archivo<- read.table("C:/Users/Usuario/Documents/data_sharing/data/household_power_consumption.txt",sep=";",header = TRUE)
# plot 1
archivo$Date<- as.Date(archivo$Date,,format="%d/%m/%Y")
archivo1<- filter(archivo,Date==c('2007-02-01','2007-02-02'))
archivo1$Time<- strptime(archivo1$Time)
archivo1$Global_active_power<-as.numeric(archivo1$Global_active_power)
# Hist
hist(archivo1$Global_active_power,ylim=c(0,1200),xlim = c(0,6),col="red",ylab="Frecuency",
     xlab = "Global Active Power(kilowatts)",main="Global Active Power")
## Saving_file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()