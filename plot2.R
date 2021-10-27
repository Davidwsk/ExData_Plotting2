# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25 <- subset(NEI, NEI$fips=="24510")

pm25.1 <- tapply(pm25$Emissions, pm25$year, sum)

pm25.df <- data.frame(year=names(pm25.1), Emissions=pm25.1)

# Display plot

png("plot2.png")

plot(pm25.df$year, pm25.df$Emissions, type="l", ylab="Baltimore City PM2.5 emission", xlab="Year")

dev.off()
