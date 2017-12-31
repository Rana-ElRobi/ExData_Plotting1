# Part 1 %in%  (Week 1) Exploring data Peer Review assignment
setwd("/home/rana/Desktop/04-ExploringData/04-week-1/ExData_Plotting1")
# Read data
all.data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE,  na="?", colClasses="character")
names(all.data)
#[1] "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power"
#[5] "Voltage"               "Global_intensity"      "Sub_metering_1"        "Sub_metering_2"       
#[9] "Sub_metering_3"

all.data$Date <- as.Date(all.data$Date,"%d/%m/%Y ")
#all.data$Time <- strptime(all.data$Time,"%H:%M:%S")

#target interval
StartDate <- "2007-02-01"
EndDate <- "2007-02-02"

# subset target period
target.data <- all.data[all.data$Date== StartDate | all.data$Date== EndDate ,]
target.data <- data.frame(target.data)

# convert the Time variable to Time class
target.data$Time <- strptime(paste(target.data$Date, target.data$Time), format="%Y-%m-%d %H:%M:%S")

for(i in 3:9){ target.data[,i] <- as.numeric(target.data[,i])}

#---------------------------------------------------
# Plot 3 code:
#--------------

plot(target.data$Time, target.data$Sub_metering_1, type="l", ylab="Energy sub metering")

# add other submeterings as separate lines
lines(target.data$Time, target.data$Sub_metering_2, col="red")
lines(target.data$Time, target.data$Sub_metering_3, col="blue")

# annotate the graph with a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.8)


# save the output to plot2.png
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()

# Side Note : the plot x axis is in Arabic as my laptop system













