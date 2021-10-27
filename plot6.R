# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25 <- subset(NEI, NEI$fips=="24510" | NEI$fips=="06037")

scc0 <- SCC[SCC$Data.Category=="Onroad",]

pm25MV <- subset(pm25, pm25$SCC %in% scc0$SCC)

pm25.df <- aggregate(pm25MV$Emissions, by=list(pm25MV$year, pm25MV$fips), sum)

names(pm25.df) <- c("year", "fips", "Emissions")

# Display plot
library("ggplot2")

ggplot(pm25.df, aes(year, Emissions, color=fips)) + geom_line() + geom_point()
