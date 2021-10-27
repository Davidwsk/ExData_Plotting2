# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

scc0 <- SCC[grep("coal",SCC$EI.Sector, ignore.case=TRUE),]

pm25.1 <- subset(NEI, NEI$SCC %in% scc0$SCC)

pm25.2 <- tapply(pm25.1$Emissions, pm25.1$year, sum)

pm25.df <- data.frame(year=names(pm25.2), Emissions=pm25.2)

# Display plot
png("plot4.png")

plot(pm25.df$year, pm25.df$Emissions, type="l", ylab="Coal PM2.5 emission", xlab="Year")

dev.off()
