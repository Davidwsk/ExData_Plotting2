# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25PerYear <- tapply(NEI$Emissions, NEI$year, sum)

pm25DF <- data.frame(year=names(pm25PerYear), Emissions=pm25PerYear)

# Display plot
plot(pm25DF$year, pm25DF$Emissions, type="l", ylab="Total PM2.5 emission", xlab="Year")
