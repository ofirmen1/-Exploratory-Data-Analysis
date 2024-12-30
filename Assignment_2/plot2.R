#Project 2 - plot 2:

path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sub1 <- subset(NEI, fips == "24510")

totalBalEmissions <- aggregate(sub1$Emissions, list(sub1$year), FUN = "sum")

png("plot2.png")

plot(totalBalEmissions, col = "magenta", type = "l", xlab = "Year",  main = expression('Total PM'[2.5]*" Emissions in the Baltimore City from 1999 to 2008"), ylab = expression('Total PM'[2.5]*" Emission (in tons)"))

dev.off()
