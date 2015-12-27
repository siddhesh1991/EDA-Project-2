library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


mv1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))

mv2 <- SCC[SCC$EI.Sector %in% mv1, ]["SCC"]

MV.ba <- NEI[NEI$SCC %in% mv2$SCC & NEI$fips == "24510",]

baltimore_mv.pm25yr <- ddply(MV.ba, .(year), function(x) sum(x$Emissions))
colnames(baltimore_mv.pm25yr)[2] <- "Emissions"


png("plot5.png",width=480,height=480,units="px",bg="transparent")
qplot(year, Emissions, data=baltimore_mv.pm25yr, geom="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
print(graph)
dev.off()



