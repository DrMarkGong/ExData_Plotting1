if(!file.exists("household_power_consumption.txt")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
    unzip("household_power_consumption.zip")
}
total_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings="?",stringsAsFactors=FALSE)
hpc <- subset(total_data,as.Date(Date,"%d/%m/%Y")==as.Date("2007-02-01")|as.Date(Date,"%d/%m/%Y")==as.Date("2007-02-02"))
hpc <- cbind(paste(hpc$Date,hpc$Time),hpc,stringsAsFactors=FALSE)
hpc <- hpc[,c(1,4:10)]
names(hpc)[1]="Time"
hpc$Time <- strptime(hpc$Time,format = "%d/%m/%Y %T")




png("Plot 3.png")
plot(hpc$Time,hpc$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering")
lines(hpc$Time,hpc$Sub_metering_2,col = "red")
lines(hpc$Time,hpc$Sub_metering_3,col = "blue")
legend("topright",
    legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    col = c("black","red","blue"),
    lty = c(1,1,1))


dev.off()