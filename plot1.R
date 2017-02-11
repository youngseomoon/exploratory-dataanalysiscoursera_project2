# Exploratory Data Analysis - Project 2.MOON

# Loading provided datasets 
NEI <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Sum emissions per year
# for each of the years 1999, 2002, 2005, and 2008.

# Generate the graph in the same directory as the source code
png(filename='C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()
