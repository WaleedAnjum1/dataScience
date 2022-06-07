library(ggplot2)
summaryscc <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


plot(emission$year, emission$Emissions, type = "o", main = "PM2.5 Total Emissions", col ="red", ylab = "PM2.5 Emissions",xlab = "Year")
