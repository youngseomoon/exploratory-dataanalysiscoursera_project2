# Exploratory Data Analysis - Project 2.MOON


require(ggplot2)

# Loading provided datasets 
NEI <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

# Generate the graph 
png(filename='C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/plot3.png', width=800, height=500, units='px')

ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
    geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
    ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
    ggtitle('Emissions per Type in Baltimore, Maryland: 1999-2008') +
    geom_jitter(alpha=0.10)

dev.off()

