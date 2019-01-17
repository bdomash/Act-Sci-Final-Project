rm(list = ls())
sheet = read.csv('Economic Indicators by Country.csv')
sheet = sheet[,c(1,3,5)]
reshape(sheet, idvar = "Country.Name", timevar = "Indicator.Name", direction = "wide")

data2 <- wide[,colSums(is.na(wide))<100]

colSums(is.na(data2))

names(data2) = substring(names(data2), 7)
names(data2)[1] = 'Country'

write.csv(data2,file="Reshaped Country Data.csv")
data2$na_count <- apply(data2, 1, function(x) sum(is.na(x)))

colNAcount = data.frame(colSums(is.na(data2)))
countryNAcount = data2[,c('Country','na_count')]



