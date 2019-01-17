rm(list = ls())
setwd('Data Sources/')
dir = list.files()

dir = dir[-c(1)]
dir
region = read.csv(dir[1],header = T,stringsAsFactors = F)
happiness = read.csv(dir[3],stringsAsFactors = F)
gdp = read.csv(dir[2],skip = 1,header = T,stringsAsFactors = F)
income.inequality = read.csv(dir[4],skip=1,header=T,stringsAsFactors = F)
internet.users = read.csv(dir[5],skip=1,header=T,stringsAsFactors = F)
life.expectancy = read.csv(dir[6],skip=1,header=T,stringsAsFactors = F)
schooling.years = read.csv(dir[7],skip=1,header=T,stringsAsFactors = F)
mortality.rate = read.csv(dir[8],skip=1,header=T,stringsAsFactors = F)
improved.drinking = read.csv(dir[9],skip=1,header=T,stringsAsFactors = F)
women.parliament = read.csv(dir[11],skip=1,header=T,stringsAsFactors = F)
suicide.rate = read.csv(dir[12],skip=1,header=T,stringsAsFactors = F)
unemployment = read.csv(dir[13],skip=1,header=T,stringsAsFactors = F)


data = happiness[, c('Country','Happiness.Score')]
newData = merge(data,region,by.x = "Country",by.y = "Short.Name",all.x = T)



region = region[, c('Short.Name','Region')]
happiness = happiness[, c('Country','Happiness.Score')]

gdp = gdp[ ,c('Country','X2017')]
gdp$Country = trimws(gdp$Country)
names(gdp)[2] = 'gdp'

income.inequality = income.inequality[,c("Country","X2017")]
income.inequality$Country = trimws(income.inequality$Country)
names(income.inequality)[2] = 'income.inequality'

internet.users = internet.users[,c("Country","X2016")]
internet.users$Country = trimws(internet.users$Country)
names(internet.users)[2] = 'internet.users'

life.expectancy = life.expectancy[,c("Country","X2017")]
life.expectancy$Country = trimws(life.expectancy$Country)
names(life.expectancy)[2] = 'life.expectancy'

schooling.years = schooling.years[,c("Country","X2017")]
schooling.years$Country = trimws(schooling.years$Country)
names(schooling.years)[2] = 'schooling.years'

mortality.rate = mortality.rate[,c("Country","X2016")]
mortality.rate$Country = trimws(mortality.rate$Country)
names(mortality.rate)[2] = 'mortality.rate'

improved.drinking = improved.drinking[,c("Country","X2015")]
improved.drinking$Country = trimws(improved.drinking$Country)
names(improved.drinking)[2] = 'improved.drinking'

women.parliament = women.parliament[,c("Country","X2017")]
women.parliament$Country = trimws(women.parliament$Country)
names(women.parliament)[2] = 'women.parliament'

suicide.rate = suicide.rate[,c("Country","X2015")]
suicide.rate$Country = trimws(suicide.rate$Country)
names(suicide.rate)[2] = 'suicide.rate'

unemployment = unemployment[,c("Country","X2017")]
unemployment$Country = trimws(unemployment$Country)
names(unemployment)[2] = 'unemployment'

newData = merge(data,region,by.x = "Country",by.y = "Short.Name",all.x = T)
newData = merge(newData,gdp,all.x=T)
newData = merge(newData,income.inequality,all.x=T)
newData = merge(newData,internet.users,all.x=T)
newData = merge(newData,life.expectancy,all.x=T)
newData = merge(newData,schooling.years,all.x=T)
newData = merge(newData,mortality.rate,all.x=T)
newData = merge(newData,improved.drinking,all.x=T)
newData = merge(newData,women.parliament,all.x=T)
newData = merge(newData,suicide.rate,all.x=T)
newData = merge(newData,unemployment,all.x=T)

names(newData)[4] = 'gdp'

setwd("..")
getwd()
write.csv(newData,file="Full Data step 3.csv")
