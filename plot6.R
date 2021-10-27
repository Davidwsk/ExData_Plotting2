# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculation
pm25 <- subset(NEI, NEI$fips=="24510" | NEI$fips=="06037")

scc0 <- SCC[SCC$Data.Category=="Onroad",]

pm25.1 <- subset(pm25, pm25$SCC %in% scc0$SCC)

pm25.df <- aggregate(pm25.1$Emissions, by=list(pm25.1$year, pm25.1$fips), sum)

names(pm25.df) <- c("year", "fips", "Emissions")

# plot
library("ggplot2")

png("plot6.png")

ggplot(pm25.df, aes(year, Emissions, color=fips)) + geom_line() + geom_point()

dev.off()
