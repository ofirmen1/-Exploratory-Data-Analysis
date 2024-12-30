#Project 2 - plot 3:

path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmissions2 <- aggregate(Emissions ~ type + year, data = sub1, FUN = sum)

png("plot3.png")

g <- ggplot(totalEmissions2, aes(x = year, y = Emissions, colour = type)) + 
  geom_line() + 
  geom_point() + 
  labs(title = expression('Total PM'[2.5]*" Emissions in Baltimore City from 1999 to 2008"), x = "Year", y = expression('Total PM'[2.5]*" Emission (in tons)"))
g

dev.off()
