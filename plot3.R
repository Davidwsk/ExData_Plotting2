# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25Baltimore <- subset(NEI, NEI$fips=="24510")

pm25DF <- aggregate(pm25Baltimore$Emissions, by=list(pm25Baltimore$year, pm25Baltimore$type), sum)

names(pm25DF) <- c("year", "type", "Emissions")

# Display plot
library("ggplot2")

ggplot(pm25DF, aes(year, Emissions, color=type)) + geom_line()


