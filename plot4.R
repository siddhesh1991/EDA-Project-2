library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


scc.combcoalMatches  <- grepl("[Cc]omb(.*)[Cc]oal|[Cc]oal(.*)[Cc]omb", SCC$Short.Name, ignore.case=TRUE)
scc.code <- SCC[scc.combcoalMatches,]
NEI.CC <- NEI[NEI$SCC %in% scc.code$SCC,]

png("plot4.png",width=480,height=480,units="px",bg="transparent")

ggplot(NEI.CC,aes(factor(year),Emissions/10^5)) +
    geom_bar(stat="identity",fill="grey",width=0.75) +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
    labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
dev.off()


