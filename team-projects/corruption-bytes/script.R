# Load Libraries
library(readr)
library(ggplot2)
library(tidyr)
library(dplyr)
library(ggthemes)

# Import data for group work
CorBytes <- read_csv("cpi_reformatted_12_16.csv")

# change Cote d'Ivoire to Ivory Coast

glimpse(CorBytes)

# Remove WE/EU
CorBytes <- filter(CorBytes, region!="WE/EU")
glimpse(CorBytes)

# Validate data for groupwork
summary(CorBytes)


# Plot scatter graph
ggplot(data=CorBytes,
       mapping=aes(x=no_trade, y=cpi_score,
                  colour=region)) +
  geom_point() + geom_text(aes(label=country))

#plot scatter graph 2012 with EU
CorBytes2012 <- read_csv("CPI_reformatted_12_16_2012only.csv")
CorBytes2012 <- filter(CorBytes2012)
ggplot(data=CorBytes2012,
       mapping=aes(x=no_trade, y=cpi_score,
                   colour=region)) +
  geom_point(size=25, alpha=0.2) +
  (ggtitle("Correlation between CPI score and number of trade agreements - 2012"))+
  (xlab("Number of trade agreements"))+
  (ylab("CPI Score"))
(theme_economist())

#Plot scatter graph 2015 with EU
CorBytes2015 <- read_csv("CPI_reformatted_12_16_2015only.csv")
ggplot(data=CorBytes2015,
       mapping=aes(x=no_trade, y=cpi_score,
                   colour=region)) +
  geom_point(size=25, alpha=0.2) +
  (ggtitle("Correlation between CPI score and number of trade agreements"))+
  (xlab("Number of trade agreements"))+
  (ylab("CPI Score"))
  (theme_economist())

#plot scatter graph 2012 without EU
CorBytes2012 <- read_csv("CPI_reformatted_12_16_2012only.csv")
CorBytes2012 <- filter(CorBytes2012, region!="WE/EU")
ggplot(data=CorBytes2012,
       mapping=aes(x=no_trade, y=cpi_score,
                   colour=region)) +
  geom_point(size=25, alpha=0.2) +
  (ggtitle("Correlation between CPI score and number of trade agreements - 2012"))+
  (xlab("Number of trade agreements"))+
  (ylab("CPI Score"))
(theme_economist())

#Plot scatter graph 2015 without EU
CorBytes2015 <- read_csv("CPI_reformatted_12_16_2015only.csv")
ggplot(data=CorBytes2015, region!="WE/EU")
       mapping=aes(x=no_trade, y=cpi_score,
                   colour=region) +
  geom_point(size=25, alpha=0.2) +
  (ggtitle("Correlation between CPI score and number of trade agreements - 2015"))+
  (xlab("Number of trade agreements"))+
  (ylab("CPI Score"))
(theme_economist())
