write.csv(finalwest, file = "finalwest.csv")

#merge
rol20132014 <- merge(rol2014, rol20132013,  by="Country")

rol2012 <- rol2012[,-3]

colnames(rol2012) = c("Country", "ROL2016", "ROL2012")

#list
FinalTiLabdata1 <- FinalTiLabdata1[,-2];

FinalTiLabdata1 <- FinalTiLabdata
#colname
colnames(rol2013)<- c("Country","Value2013")

#mean
mean(rol20132014$Value2013,rol20132014$Value2014)

rol20132014$roltest <- (rol20132014$Value2013 + rol20132014$Value2014)/2

write.csv(FinalTiLabdata, file = "finalTiLabdata.csv")

#FinalLab merge with rol2012
finalrols <- merge(FinalTiLabdata,rol2012)

finalrols <- finalrols[,-4]

#happiness indexes
colnames(happy2012) = c("X", "Country", "happy2012")
colnames(happy2016) = c("Country", "happy2016")

finalrols <- merge(finalrols, happy2016, by="Country")

#final
write.csv(finalrols, file="finalrols.csv")

#west and east separation
colnames(west) = "Country";
colnames(east) = "Country";

finalwest <- merge(finalrols,west, by="Country");
finaleast <- merge(finalrols,east, by="Country");

#ggplot

library(ggplot2)

#Use ggplot function to plot things
ggplot(data = cpi2016, mapping = aes(x=CPI2016, y=Global.Insight.Country.Risk.Ratings,
                                     colour=Region)) + geom_point(aes(size=Rank))

#Plot a bar chart
rule_of_law <- 10
happiness_index <- 1

#ggthemes
library("ggthemes")
library("scales")

#ggplot with bubbles
ggplot(data=finaleast, mapping = aes(x=rule_of_law, y=happiness_index))  +
  xlim(4, 10) +
  ylim(0.3, 1) +
  geom_point(data=finaleast, mapping=aes(x=happy2016,
                                         y=ROL2016),
             size=finaleast$GDP/5000, color="blue") +
  geom_text(data=finaleast, mapping=aes(x=happy2016,
                                        y=ROL2016,
                                        label=substr(Country, 1, 30)),
            size=4, vjust=2, hjust=0.2) +
  geom_smooth(data=finaleast, mapping=aes(x=happy2016,
                                          y=ROL2016),
              method = lm, se=FALSE, fullrange=TRUE)+
  geom_point(data=finalwest, mapping=aes(x=happy2016,
                                         y=ROL2016),
             size=finalwest$GDP/5000, color="red") +
  geom_text(data=finalwest, mapping=aes(x=happy2016,
                                        y=ROL2016,
                                        label=substr(Country, 1, 30)),
            size=4, vjust=2, hjust=0.2) +
  geom_smooth(data=finalwest, mapping=aes(x=happy2016,
                                          y=ROL2016),
              method = lm, se=FALSE, fullrange=TRUE)

#ggplot for arrows FOR EAST AND WEST
ggplot(data=finalrols, mapping = aes(x=rule_of_law, y=happiness_index))  +
  xlim(4, 10) +
  ylim(0.3, 1) +
  geom_segment(data=finalrols, mapping=aes(x=happy2012,
                                           y=ROL2012,
                                           xend=happy2016,
                                           yend=ROL2016), arrow=arrow(),
               size=0.2, colour="red") +
  geom_text(data=finalrols, mapping=aes(x=happy2012,
                                        y=ROL2012,
                                        label=substr(Country, 1, 30)),
            size=4, vjust=2, hjust=0.2)
