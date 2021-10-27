# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25.1 <- tapply(NEI$Emissions, NEI$year, sum)

pm25.df <- data.frame(year=names(pm25.1), Emissions=pm25.1)

# Display plot

png("plot1.png")

plot(pm25.df$year, pm25.df$Emissions, type="l", ylab="Total PM2.5 emission", xlab="Year")

dev.off()
