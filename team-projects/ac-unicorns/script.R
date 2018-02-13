#loading libraries
library(readxl)
library(dplyr)
library(readr)
library(ggplot2)
library(car)

#loading data sets
combination<-read.csv("mybeautifultable.csv",sep = ";")
population<-read_xlsx("mybeautifultable1.xlsx")

#first20 rows
population<-population[1:20,]

#checking out the dataset structure
str(population)

#change GII column character to number (nes anks2iau buvo character ir todel apacioje rpode labai didele skale)
population$GII_2015<-as.numeric(population$GII_2015)

#change Region to factor
population$Region<-as.factor(population$Region)

#scatterplot
ggplot(data=population,
       mapping=aes(x=GII_2015, y=CPI_2015)) +
  geom_point (mapping = aes(size=Population_2015, colour=Region)) +
  geom_text(mapping=aes(x=GII_2015, y=CPI_2015, label=substr(population$`Country Code`, 1, 30)))
summary(population$Population_2015)

#testing boxplot, distribution population variable
boxplot(population$Population_2015)

#saving dataset
library(readr)

write.csv(population, "population.csv")
