### R code from vignette source 'HistogramTools-quickref.Rnw'

###################################################
### code chunk number 1: HistogramTools-quickref.Rnw:27-31
###################################################
options(width=50)
library(HistogramTools)
set.seed(0)
ht.version <- packageDescription("HistogramTools")$Version


###################################################
### code chunk number 2: HistogramTools-quickref.Rnw:62-67 (eval = FALSE)
###################################################
## h <- hist(runif(100, 0, 100),
##           breaks=seq(from=0,to=200,by=5), plot=F)
## TrimHistogram(h)
## SubsetHistogram(h, maxbreak=70)
## MergeBuckets(h, adj.buckets=2)


###################################################
### code chunk number 3: HistogramTools-quickref.Rnw:70-72
###################################################
h <- hist(runif(100, 0, 100),
          breaks=seq(from=0,to=200,by=5), plot=F)


###################################################
### code chunk number 4: exhist
###################################################
par(mfrow=c(2,2))
plot(h, main="Histogram h")
plot(TrimHistogram(h), main="TrimHistogram(h)")
plot(SubsetHistogram(h, max=70), main="SubsetHistogram(h, max=70)")
plot(MergeBuckets(h, 4), main="MergeBuckets(h, 4)")


###################################################
### code chunk number 5: errorhist
###################################################
par(mfrow=c(1,2), par(mar=c(5,4,4,0)+0.1))
PlotEMDCC(h)
PlotKSDCC(h)
EMDCC(h)
KSDCC(h)


###################################################
### code chunk number 6: HistogramTools-quickref.Rnw:132-134 (eval = FALSE)
###################################################
## hist.msg <- as.Message(h)
## length(hist.msg$serialize(NULL))


###################################################
### code chunk number 7: HistogramTools-quickref.Rnw:136-140
###################################################
if(require(RProtoBuf)) {
  hist.msg <- as.Message(h)
  length(hist.msg$serialize(NULL))
}


