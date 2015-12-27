library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

v <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
v.SCC <- SCC[v,]$SCC
v.NEI <- NEI[NEI$SCC %in% v.SCC,]


v.Baltimore.NEI <- v.NEI[v.NEI$fips=="24510",]
v.Baltimore.NEI$city <- "Baltimore City"

v.LANEI <- v.NEI[v.NEI$fips=="06037",]
v.LANEI$city <- "Los Angeles County"


bNEI <- rbind(v.Baltimore.NEI,v.LANEI)

png("plot6.png",width=480,height=480,units="px",bg="transparent")

ggplot(bNEI, aes(factor(year), y=Emissions, fill=city)) +
    geom_bar(stat="identity") +
    facet_grid(scales="free", space="free", .~city) +
    guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore & LA, 1999-2008"))

dev.off()