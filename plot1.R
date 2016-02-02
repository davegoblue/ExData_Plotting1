## This script is for completion of a Coursera Project in Exploratory Data Analysis
## This script is run using 64-bit R 3.2.3 on a Windows 7 machine

## Data is originally from UCI: http://archive.ics.uci.edu/ml/
## https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
## As archived for this particular assignment at:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## The download process created a ZIP file "exdata-data-household_power_consumption" on my hard drive
## Prior to running this script, I extracted the single text file from the ZIP
## The text file was immediately read-protected; no other pre-processing was run on the raw data


readRawFile <- function() {

    ## Set pointers to the raw data, and read in a ";" delimited text file with header
    dirCoursera <- "C:/Users/Dave/Documents/Personal/Learning/Coursera/"
    dirDS04Week01 <- "RDirectory/RHomework/DS04Week01/RawDataUnzipped/"
    fileRawName <- "household_power_consumption.txt"

    myRawData <- read.table(paste0(dirCoursera,dirDS04Week01,fileRawName),stringsAsFactors=FALSE,
                            header=TRUE,sep=";",na.strings=c("","?","NA"))

    ## Confirm that dimensions are as expected
    if ((nrow(myRawData) != 2075259) | ncol(myRawData) != 9) {
         stop("Incorrect dimensions for raw data file, expected 2,075,259 x 9, aborting")
    }
    
    return(myRawData)
    
}


convRawFile <- function(useFrame) {
    
    ## Convert Date and Time to system usable dates and times (useTime creation very inefficient)
    useFrame$useTime <- strptime(paste(useFrame[,1],useFrame[,2]),format="%d/%m/%Y %H:%M:%S")
    useFrame$useDate <- as.Date(useFrame$Date,format="%d/%m/%Y")

    ## Add the weekday also in case it is helpful for later (probably will not be)
    useFrame$useWeekday <- substr(weekdays(useFrame$useTime),1,3)
    
    return(useFrame)
    
}


readAndCleanData <- function () {

    ## Read and check the raw text file    
    myRawData <- readRawFile()

    ## Subset the data so we only use 2007-02-01 and 2007-02-02 for code run time efficiency
    ## Note that Date has not yet been converted, so this is on a charcter string match
    ## Relevant dates will be "1/2/2007" and "2/2/2007" based on d/m/yyyy format of character
    myUseData <- subset(myRawData,Date=="1/2/2007" | Date=="2/2/2007")

    ## Then take the smaller file and make the dates and times usable
    myUseData <- convRawFile(myUseData)
    return(myUseData)
}


## Make the first plot of interest (histogram of Global Active Power)

myUseData <- readAndCleanData()

png(filename="plot1.png")

hist(myUseData$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()