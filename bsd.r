rm(list=ls())
library("gdata", lib.loc="H:/R/R-3.1.0/library")
library("astsa", lib.loc="H:/R/R-3.1.0/library")
library("graphics", lib.loc="H:/R/R-3.1.0/library")
library("MASS", lib.loc="H:/R/R-3.1.0/library")
library("stats", lib.loc="H:/R/R-3.1.0/library")
library("TTR", lib.loc="H:/R/R-3.1.0/library")
library("zoo", lib.loc="H:/R/R-3.1.0/library")
bsd<-read.dta("H:\\Ahmed\\Thesis\\bsd\\bsd.dta")
names<-bsd[1,]
colnames(bsd)<-names
bsd<-bsd[-1,]
rm(names)
dots<- bsd == "."
bsd[dots]<-NA
rm(dots)
bsd<-sapply(bsd, as.numeric)
bsd<-data.frame(bsd)
sample<-bsd[35:74,c(1,6:12)]
row.names(sample) <- NULL
sample<-sample[,c(1,5,8,3,4,6,2)]
colnames(sample)[3]<-"Turn"
sample<-transform(sample, Turn= Turn*100, s= s*100)
sample$Turn[40]<-NA
sample$ripo[40]<-NA
sample$pdnd[40]<-NA




cormat<-as.matrix(cor(bsd, use="complete.obs"))
cormat<-cormat[-1,-1]
is.character(bsd$ripo[1])
