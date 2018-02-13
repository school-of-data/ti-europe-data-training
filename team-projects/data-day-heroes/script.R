library(ggplot2)

ddh <- read_csv("cpi2016_variables.csv")

#Draw the main graph (p)
p <- ggplot(data=ddh,
       mapping = aes(x=ddh$WorldJusticeProjectRuleofLawIndex,y=ddh$CPI2016)) +
  geom_point() +
  theme_solarized()
p

#Draw interception line at the medians (p2)
#1) Calculate the medians
CPImedian <- median(ddh$CPI2016)
WJmedian <- median(ddh$WorldJusticeProjectRuleofLawIndex)

#2) Draw the line
p2 <- p + geom_vline(xintercept = CPImedian, linetype="dashed", colour="blue") +
  geom_hline(yintercept = WJmedian, linetype="dashed", colour="blue")

p2

#Add titles (p3)
p3 <- p2 + ggtitle("Corruption perception by rule of law") + xlab("Rule of Law") + ylab("CPI 2016")

p3

#Add conditional labelling for countries in the UpLeft and DownRight areas only - using ifelse (p4)
p4 <- p3 + geom_text(aes(label=ifelse((ddh$CPI2016>CPImedian & ddh$WorldJusticeProjectRuleofLawIndex<WJmedian)|(ddh$CPI2016<CPImedian & ddh$WorldJusticeProjectRuleofLawIndex>WJmedian),ddh$Country,' '),
                         size=5))

p4

#Create new column for medians
ddh$Median <- "No"
ddh$Median[ddh$CPI2016>CPImedian & ddh$WorldJusticeProjectRuleofLawIndex<WJmedian] <- "Positive perception biais"
ddh$Median[ddh$CPI2016<CPImedian & ddh$WorldJusticeProjectRuleofLawIndex>WJmedian] <- "Negative perception biais"


p4 + geom_point(aes(color=ddh$Median))
