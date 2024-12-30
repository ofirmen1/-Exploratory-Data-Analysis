#Project 2 - plot 4:

path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalSor <- SCC[grep("Comb.*Coal", SCC$Short.Name), "SCC"]

coalNEI <- merge(NEI, data.frame(SCC = coalSor), by = "SCC")

totalEmissions3 <- aggregate(Emissions ~ year, data = coalNEI, FUN = "sum")

png("plot4.png")

g2 <- ggplot(totalEmissions3, aes(x = year, y = Emissions)) + geom_line(col = "black") + geom_point(col = "red") + labs(title = expression('Total PM'[2.5]*" Coal Emissions in the United States from 1999 to 2008"), x = "Year", y = expression('Total PM'[2.5]*" Emission (in tons)"))

g2

dev.off()
