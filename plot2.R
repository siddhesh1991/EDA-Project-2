NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


baltimore_data <- subset(NEI, NEI$fips == 24510, select = c(Emissions,year))
baltimore_aggr <- aggregate(Emissions ~ year, baltimore_data, sum)
png("plot2.png",width=480,height=480,units="px",bg="transparent")
plot(baltimore_aggr$year,baltimore_aggr$Emission, type = "l", xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' Emissions in Baltimore by Year '), col = "Green")
dev.off()