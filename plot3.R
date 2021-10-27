# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25 <- subset(NEI, NEI$fips=="24510")

pm25.df <- aggregate(pm25$Emissions, by=list(pm25$year, pm25$type), sum)

names(pm25.df) <- c("year", "type", "Emissions")

# Display plot
library("ggplot2")

png("plot3.png")

ggplot(pm25.df, aes(year, Emissions, color=type)) + geom_line() + geom_point()

dev.off()
