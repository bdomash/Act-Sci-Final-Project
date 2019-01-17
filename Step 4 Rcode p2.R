rm(list = ls())
data = read.csv('Project/Full Data step 3 new.csv')
data = data[,-1]
data$Happiness.Score = data$Happiness.Score*10
summary(data)
continuousData = data[,-c(1,3)]
hist(data$Happiness.Score,main='Histogram of Country Happiness Scores',xlab='Score',ylab='Frequency')
data$lnGDP = log(data$gdp)

data$gdp = NULL
hist(data$lnGDP)
pairs(continuousData[1:5,1:5])
vars = c("Happiness.Score","Region","lnGDP","internet.users","life.expectancy","schooling.years",
         "mortality.rate","improved.drinking","women.parliament","suicide.rate","unemployment")

str(continuousData)

cor(na.omit(continuousData))[8,]

boxplot(data$improved.drinking)
boxplot(data$gdp, main = 'GDP Per Capita')
summary(data$life.expectancy)
model = lm(Happiness.Score~lnGDP+internet.users+life.expectancy+schooling.years+lnImproved.drinking+
             women.parliament+suicide.rate+lnUnemployment+Region,data=data)
> boxplot(data$women.parliament)

data$lnGDP = log(data$gdp)
data$gdp = NULL
data$lnMortality.rate = log(data$mortality.rate)
data$mortality.rate = NULL
data$lnImproved.drinking = log(data$improved.drinking)
data$improved.drinking = NULL
data$lnUnemployment = log(data$unemployment)
data$unemployment = NULL

colnames(data)
continuousData = data[,-c(1,3)]
hist(continuousData)
cor(na.omit(explanitory[,-1]))

vifSuicide = lm(suicide.rate~lnGDP+lnInternet.users+life.expectancy+schooling.years+mortality.rate+improved.drinking+
                   women.parliament+unemployment+Region,data=data)
vifSuicideR = summary(vifInternet)$r.squared
vif1 = 1/(1-vifSuicideR); vif1

vifInternet = lm(internet.users~lnGDP+suicide.rate+life.expectancy+schooling.years+mortality.rate+improved.drinking+
                  women.parliament+unemployment+Region,data=data)
vifInternetR = summary(vifInternet)$r.squared
vif2 = 1/(1-vifInternetR); vif2 #7.95; highly colinear

explanitory = data[,-c(1,2)]
explanitory = data[]

1/(1-summary(lm(internet.users~.,data=explanitory))$r.squared)
1/(1-summary(lm(schooling.years~.,data=explanitory))$r.squared)

explanitory = explanitory[,-8]
lm(lnMortality.rate~.,data=explanitory)$r.squared
1/(1-summary(lm(lnMortality.rate~.,data=explanitory))$r.squared) #yes
1/(1-summary(lm(schooling.years~.,data=explanitory))$r.squared) #yes

summary(model)

plot(model)

alpha <- 0.05
N <- nrow(data)
K <- 15
J <- 13
fcr <- qf(1-alpha, J, N-K)
anova(model)
cor(na.omit(continuousData))

unique(data$Region)

library(dplyr)
aggregate(data, list(data$Region), mean)

d = data[,-c(1:3)]
colnames(d) = abbreviate(colnames(d))
colnames(d)

cormat = round(cor(na.omit(d)),2)
cormat[upper.tri(cormat)] = NA
head(cormat)
melted_cormat = melt(cormat);melted_cormat
ggplot(data=melted_cormat,aes(x=Var1,y=Var2,fill=value))+
  geom_tile(color='white')+
  geom_text(aes(Var1,Var2,label=value),color='black',size=4)+
  scale_fill_gradient2(low="blue",high='red',mid = 'white',midpoint=0,limit=c(-1,1),space='Lab')

library("Hmisc")
res2 <- rcorr(as.matrix(na.omit(d)))
cormat = round(res2$P,2)
res2$P
