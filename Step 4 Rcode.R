rm(list = ls())
setwd("_Senior Fall/Act Sci 654")
data = read.csv('Project/Full Data step 3.csv')
hist(data$gdp,xlab="GDP Per Capita",ylab='',main = 'Histogram of GDP per Capital') #skewed, thus log
hist(log(data$gdp),xlab="GDP Per Capita",ylab='',main = 'Histogram of GDP per Capital')#less skewed

hist(data$Happiness.Score*10)
data$lnGDP = log(data$gdp)

vars = c("Happiness.Score","Happiness.Score","Region","gdp","internet.users","life.expectancy","schooling.years",
         "mortality.rate","improved.drinking","women.parliament","suicide.rate","unemployment")

data$gdp = NULL

model = lm(data$Happiness.Score~data$lnGDP+data$internet.users+data$life.expectancy+data$schooling.years
           +data$mortality.rate+data$improved.drinking+data$women.parliament+data$suicide.rate+data$unemployment+data$Region)

data$Happiness.Score
summary(model)
sd(data$Happiness.Score)
cor(continuousData)
colnames(data)
cont = data[,-c(1,3)]
cor(na.omit(continuousData))

head(data$Happiness.Score)

vifModel = lm(data$internet.users~data$Happiness.Score+data$lnGDP+data$life.expectancy+data$schooling.years
              +data$mortality.rate+data$improved.drinking+data$women.parliament+data$suicide.rate+data$unemployment+data$Region)
summary(vifModel)$r.squared
vifModel$terms
vifScore = 1/(1-summary(vifModel)$r.squared)
vifScore
boxplot(data$Happiness.Score)
colnames(data)
data2 = data[,c(-4)]
model2 = lm(data$Happiness.Score~data$lnGDP+data$life.expectancy+data$schooling.years
           +data$mortality.rate+data$improved.drinking+data$women.parliament+data$suicide.rate+data$unemployment+data$Region)
summary(model2)
plot(model)

plot(data$women.parliament,data$lnGDP,xlab="Percent of Women in Parliament",ylab = 'Log GDP per Capita',
     main = 'Women in Parliament (%) vs GDP')

data[112,]

library(tidyverse)
library(reshape)
library(ggplot2)
cormat = round(cor(na.omit(continuousData)),2)
#cormat[upper.tri(cormat)] = NA
head(cormat)
melted_cormat = melt(cormat);melted_cormat
ggplot(data=melted_cormat,aes(x=Var1,y=Var2,fill=value))+
  geom_tile(color='white')+
  geom_text(aes(Var1,Var2,label=value),color='black',size=4)+
  scale_fill_gradient2(low="blue",high='red',mid = 'white',midpoint=0,limit=c(-1,1),space='Lab')

