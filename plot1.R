
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


agby <- aggregate(NEI$Emissions, by=list(NEI$year), sum)
names(agby)[1] <- c("Year")
names(agby)[2] <- c("Emission")

plot(agby$Year,agby$Emission, type = "l", xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total US PM'[2.5]*' Emissions by years'), col = "Green")

dev.off()

