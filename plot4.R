# Exploratory Data Analysis - Project 2.MOON

require(ggplot2)

# Loading provided datasets 
NEI <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")


# Coal combustion 
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Generate the graph in the same directory as the source code
png(filename='C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/plot4.png')

ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
    geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
    ggtitle(expression('missions from coal combustion-related sources changed from 1999-2008')) + 
    ylab(expression(paste('PM in kilotons'))) + 
    geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
    theme(legend.position='none') + scale_colour_gradient(low='yellow', high='black')

dev.off()

