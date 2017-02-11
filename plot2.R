# Exploratory Data Analysis - Project 2.MOON

# Loading provided datasets 
NEI <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Subset area
MD <- subset(NEI, fips=='24510')

# Sum emission per year

# Generate the graph in the same directory as the source code
png(filename='C:/Users/mmoon/Documents/DataScience_JohnHopkines/exdata%2Fdata%2FNEI_data/plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()

