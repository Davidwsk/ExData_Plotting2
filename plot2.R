# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25Baltimore <- subset(NEI, NEI$fips=="24510")

pm25PerYear <- tapply(pm25Baltimore$Emissions, pm25Baltimore$year, sum)

pm25DF <- data.frame(year=names(pm25PerYear), Emissions=pm25PerYear)

# Display plot
plot(pm25DF$year, pm25DF$Emissions, type="l", ylab="Baltimore City PM2.5 emission", xlab="Year")
