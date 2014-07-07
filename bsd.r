library("gdata", lib.loc="H:/R/R-3.1.0/library")
library("foreign", lib.loc="H:/R/R-3.1.0/library")
bsd<-read.dta("H:\\Ahmed\\Thesis\\bsd\\bsd.dta")
names<-bsd[1,]
colnames(bsd)<-names
bsd<-bsd[-1,]
rm(names)
bsd$cefd<-as.numeric(bsd$cefd)
bsd$sent^<-as.numeric(bsd$sent^)
bsd$sent^(old)<-as.numeric(bsd$sent^(old))
bsd$sent<-as.numeric(bsd$sent)
bsd$sent(old)<-as.numeric(bsd$sent(old))
bsd$ripo<-as.numeric(bsd$ripo)
bsd$pdnd<-as.numeric(bsd$pdnd)
bsd$nipo<-as.numeric(bsd$nipo)
bsd$s<-as.numeric(bsd$s)
bsd$turn<-as.numeric(bsd$turn)
bsd$ldturn<-as.numeric(bsd$ldturn)
