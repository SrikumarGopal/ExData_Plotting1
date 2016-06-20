## exploratoryDataAnalysis Course Project 1 - Week 1 
## Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.  
## Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
## plot1.png


message("reading the file")
data_set <- read.csv("./data/exploratoryDataAnalysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

message("Set date format")
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

message("subsetting the data for the date range")
Subset_data <- subset(data_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_set)

message("converting the date format")
datetime <- paste(as.Date(Subset_data$Date), Subset_data$Time)
Subset_data$Datetime <- as.POSIXct(datetime)

message("plotting: Plot 1")
hist(Subset_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

message("saving to file")
dev.copy(png, file="./data/exploratoryDataAnalysis/plot1.png", height=480, width=480)
dev.off()
message("file copy complete")