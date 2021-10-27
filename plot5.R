# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25Baltimore <- subset(NEI, NEI$fips=="24510")

SCCMV <- SCC[grep("motor vehicle",SCC$Short.Name, ignore.case=TRUE),]

NEIMV <- subset(pm25Baltimore, pm25Baltimore$SCC %in% SCCMV$SCC)

pm25PerYear <- tapply(NEIMV$Emissions, NEIMV$year, sum)

pm25DF <- data.frame(year=names(pm25PerYear), Emissions=pm25PerYear)

# Display plot
plot(pm25DF$year, pm25DF$Emissions, type="l", ylab="Coal PM2.5 emission", xlab="Year")
