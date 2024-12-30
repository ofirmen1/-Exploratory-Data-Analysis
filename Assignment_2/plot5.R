#Project 2 - plot 5:

path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sub1 <- subset(NEI, fips == "24510")

sub2 <- sub1[sub1$type == "ON-ROAD",]

totalEmissions4 <- aggregate(Emissions ~ year + fips, data =sub2, FUN = "sum")

png("plot5.png")

g3 <- ggplot(totalEmissions4, aes(x = year, y = Emissions)) + geom_line(col = "black") + geom_point(col = "red") + labs(title = expression('Total PM'[2.5]*" Motor Emissions in the Baltimore City from 1999 to 2008"), x = "Year", y = expression('Total PM'[2.5]*" Emission (in tons)"))

g3

dev.off()
