#Project 2 - plot 6:

path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sub2 <- sub1[sub1$type == "ON-ROAD",]

sub3 <- subset(NEI, fips == "06037" & type == "ON-ROAD")

totalEmissions4 <- aggregate(Emissions ~ year + fips, data =sub2, FUN = "sum")

totalEmissions5 <- aggregate(Emissions ~ year + fips, data = sub3, FUN = "sum")

mergeEmissions <- rbind(totalEmissions5, totalEmissions4)

png("plot6.png", width = 720)

g4 <- ggplot(mergeEmissions, aes(x = factor(year), y = Emissions, fill = fips)) + 
  geom_bar(stat="identity", alpha = .5) +
  geom_text(aes(label = sprintf("%.1f", Emissions)), 
            position = position_stack(vjust = 0.5), color = "black") +
  labs(title = expression('Total PM'[2.5]*" Motor Emissions in Baltimore City & LA County from 1999 to 2008"), x = "Year", y = expression('Total PM'[2.5]*" Emission (in tons)")) +
  scale_fill_discrete(name = "Region", 
                      labels = c("Los Angeles County", "Baltimore City"))

g4

dev.off()
