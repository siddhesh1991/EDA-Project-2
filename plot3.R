library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


baltimore_data <- subset(NEI, NEI$fips == 24510)
baltimore_aggr <- aggregate(Emissions ~ year + type, baltimore_data, sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")
qplot(year, Emissions, data=baltimore_aggr, color=type, geom ="line")+ ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
dev.off()

