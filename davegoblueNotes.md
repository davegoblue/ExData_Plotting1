### Quick description


This repository is originally forked from rdpeng/ExData_Plotting1 as per the directions in a Coursera assignment


A ZIP file was downloaded, and the text file inside the ZIP file was manually extracted to my machine (Windows 7, running 64-bit R 3.2.2)


There are four (4) scripts which each produce a default (480x480) PNG file.  Every script reads in the extracted text file, processes the data, and writes the plot directly to PNG (plots not displayed on computer screen)


* plot1.R creates plot1.png, a red histogram of Global Active Power
* plot2.R creates plot2.png, a black line graph for Global Active Power vs. Time
* plot3.R creates plot3.png, three line graphs for Sub_metering<1/2/3> superimposed and with a legend
* plot4.R creates plot4.png, a 2x2 containing (filled by column) plot2, plot3, Voltage vs. Time, Global Reactive Power vs. Time


Each of the scripts is designed to stand-alone and therefore reads in the raw text file and pre-processes it for graphing.  This would be inefficient if trying to reproduce as data loading is the strong majority of system and elapsed time.

The data loading and cleaning is run by functions.  If you just want to test some different parameters, quicker options are suggested below:

* If you already loaded and cleaned data and want to use existing data frame myUseData, then comment out the first relevant line following the functions ## myUseData <- readAndCleanData()
* If you already loaded data and have data frame myRawData (these scripts do not save that, but suppose you had edited to do so) but want to clean/subset differently, edit the first line of function readAndCleanData to be     ## myRawData <- readRawFile()
