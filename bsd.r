rm(list=ls())
library("gdata", lib.loc="H:/R/R-3.1.0/library")
library("foreign", lib.loc="H:/R/R-3.1.0/library")
bsd<-read.dta("H:\\Ahmed\\Thesis\\bsd\\bsd.dta")
names<-bsd[1,]
colnames(bsd)<-names
bsd<-bsd[-1,]
rm(names)
dots<- bsd == "."
rm(dots)
bsd[dots]<-NA
bsd<-sapply(bsd, as.numeric)
bsd<-data.frame(bsd)
