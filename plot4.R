# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCCoal <- SCC[grep("coal",SCC$EI.Sector, ignore.case=TRUE),]

NEICoal <- subset(NEI, NEI$SCC %in% SCCCoal$SCC)

pm25PerYear <- tapply(NEICoal$Emissions, NEICoal$year, sum)

pm25DF <- data.frame(year=names(pm25PerYear), Emissions=pm25PerYear)

# Display plot
plot(pm25DF$year, pm25DF$Emissions, type="l", ylab="Coal PM2.5 emission", xlab="Year")
