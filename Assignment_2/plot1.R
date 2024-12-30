#Project 2 - plot 1:

path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmissions <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")

png("plot1.png")

plot(totalEmissions, type = "l", pch = 19, col = "blue", xlab = "Year",  main = expression('Total PM'[2.5]*" Emissions in the United States from 1999 to 2008"), ylab = expression('Total PM'[2.5]*" Emission (in tons)"))

dev.off()
