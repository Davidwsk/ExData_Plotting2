# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25 <- subset(NEI, NEI$fips=="24510")

scc0 <- SCC[SCC$Data.Category=="Onroad",]

pm25.1 <- subset(pm25, pm25$SCC %in% scc0$SCC)

pm25.2 <- tapply(pm25.1$Emissions, pm25.1$year, sum)

pm25.df <- data.frame(year=names(pm25.2), Emissions=pm25.2)

# Display plot
library("ggplot2")

png("plot5.png")

ggplot(pm25.df, aes(year, Emissions, group=1)) + geom_line() + geom_point()

dev.off()
