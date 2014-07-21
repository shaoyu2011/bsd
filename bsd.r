rm(list=ls())   
library(foreign)
library(gdata)
library(astsa)
library(graphics)
library(MASS)
library(stats)
library(zoo)
library(TTR)
library(pastecs)
library(dplyr)
library(stringr)
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
sample<-sample[,c(1,5,8,3,4,6,2)]  # rearrange the sample to match the paper order
colnames(sample)[3]<-"turn"
sample<-transform(sample, turn= turn*100, s= s*100)
#sample$Turn[40]<-NA
#sample$ripo[40]<-NA
#sample$pdnd[40]<-NA
sample.desc<-stat.desc(sample[-1])                     # drop year
sample.desc<-sample.desc[c(-1:-3,-6:-8,-10:-12,-14),]  # get only mean,min,max and sd
sample.desc<-t(sample.desc)                            # traspose the summary stats
sample.desc<-data.frame(sample.desc)                   # change to data frame
sample.desc<-sample.desc[c(3,4,1,2)]                   # rearange  to match paper
s.ts<-sample %>% mutate_each(funs(lead(.,1))) %>% cbind(sample, .) #get the leading values beside the original
s.ts<-s.ts[,-8] #remove the repeted years
colnames(s.ts)[8:13]<-str_c("l", colnames(s.ts)[2:7])  # change the column name
s.ts[1,2;7]<-NA   # chage the first value of the original values
s.ts<-s.ts[c(1,2,8,3,9,4,10,5,11,6,12,7,13)]  # rearrange the columns so each variable beside its lead


