### R code from vignette source 'HistogramTools.Rnw'

###################################################
### code chunk number 1: HistogramTools.Rnw:45-50
###################################################
library("HistogramTools")
options("width"=65)
set.seed(0)
ht.version <- packageDescription("HistogramTools")$Version
prettyDate <- format(Sys.Date(), "%B %e, %Y")


###################################################
### code chunk number 2: exhist
###################################################
myhist <- hist(runif(100))


###################################################
### code chunk number 3: HistogramTools.Rnw:234-235
###################################################
myhist


###################################################
### code chunk number 4: HistogramTools.Rnw:257-258
###################################################
length(serialize(myhist, NULL))


###################################################
### code chunk number 5: HistogramTools.Rnw:277-279
###################################################
invisible(cat(paste(readLines(system.file("proto/histogram.proto",
                                package="HistogramTools")), "\n")))


###################################################
### code chunk number 6: HistogramTools.Rnw:289-290
###################################################
hist.msg <- as.Message(myhist)


###################################################
### code chunk number 7: HistogramTools.Rnw:295-296
###################################################
cat(as.character(hist.msg))


###################################################
### code chunk number 8: HistogramTools.Rnw:301-302
###################################################
length(hist.msg$serialize(NULL))


###################################################
### code chunk number 9: HistogramTools.Rnw:308-310
###################################################
raw.bytes <- memCompress(hist.msg$serialize(NULL), "gzip")
print(length(raw.bytes))


###################################################
### code chunk number 10: HistogramTools.Rnw:319-320
###################################################
uncompressed.bytes <- memDecompress(raw.bytes, "gzip")


###################################################
### code chunk number 11: HistogramTools.Rnw:322-324
###################################################
length(uncompressed.bytes)
new.hist.proto <- HistogramTools.HistogramState$read(uncompressed.bytes)


###################################################
### code chunk number 12: HistogramTools.Rnw:331-334
###################################################
par(mfrow=c(1,2))
plot(myhist)
plot(as.histogram(new.hist.proto))


###################################################
### code chunk number 13: HistogramTools.Rnw:351-352
###################################################
hist <- hist(c(1,2,3), breaks=c(0,1,2,3,4,5,6,7,8,9), plot=FALSE)


###################################################
### code chunk number 14: HistogramTools.Rnw:354-358
###################################################
Count(hist)
ApproxMean(hist)
ApproxQuantile(hist, .5)
ApproxQuantile(hist, c(.05, .95))


###################################################
### code chunk number 15: execdf
###################################################
h <- hist(runif(100), plot=FALSE)
e <- HistToEcdf(h)
e(.5)
par(mfrow=c(1,2))
plot(h)
plot(HistToEcdf(h))
par(mfrow=c(1,1))


###################################################
### code chunk number 16: HistogramTools.Rnw:424-430
###################################################
PlotAll <- function(x, h) {
  plot(x, main="x")
  plot(h)
  PlotKSDCC(h, 0.3)
  PlotEMDCC(h)
}


###################################################
### code chunk number 17: HistogramTools.Rnw:448-454
###################################################
x <- rexp(1000)
h <- hist(x, breaks=c(0,1,2,3,4,8,16,32), plot=FALSE)
x.min <- rep(head(h$breaks, -1), h$counts)
x.max <- rep(tail(h$breaks, -1), h$counts)
ks.test(x.min, x.max, exact=F)
KSDCC(h)


###################################################
### code chunk number 18: hist1mdcc
###################################################
par(mfrow=c(2,3))

x <- rexp(100)
h1 <- hist(x, plot=FALSE)
h2 <- hist(x, breaks=seq(0,round(max(x) + 1),by=0.1), plot=FALSE)

plot(sort(x), main="sort(x)")
plot(h1)
PlotKSDCC(h1, 0.2, main="CDF with KSDCC")

plot(sort(x), main="sort(x)")
plot(h2)
PlotKSDCC(h2, 0.2, main="CDF with KSDCC")


###################################################
### code chunk number 19: hist1emdcc
###################################################
par(mfrow=c(2,3))
plot(sort(x), main="sort(x)")
plot(h1)
PlotEMDCC(h1, main="CDF with EMDCC")

plot(sort(x), main="sort(x)")
plot(h2)
PlotEMDCC(h2, main="CDF with EMDCC")


###################################################
### code chunk number 20: HistogramTools.Rnw:563-570
###################################################
x <- rexp(100)
h1 <- hist(x, plot=FALSE)
h2 <- hist(x, breaks=seq(0,round(max(x) + 1),by=0.1), plot=FALSE)
KSDCC(h1)
KSDCC(h2)
EMDCC(h1)
EMDCC(h2)


###################################################
### code chunk number 21: HistogramTools.Rnw:587-589
###################################################
hist.1 <- hist(runif(100,min=2,max=4), breaks=seq(0,6,by=.2), plot=FALSE)
hist.trimmed <- TrimHistogram(hist.1)


###################################################
### code chunk number 22: HistogramTools.Rnw:592-596
###################################################
length(hist.1$counts)
sum(hist.1$counts)
length(hist.trimmed$counts)
sum(hist.trimmed$counts)


###################################################
### code chunk number 23: trimhist
###################################################
par(mfrow=c(1,2))
plot(hist.1)
plot(TrimHistogram(hist.1), main="Trimmed Histogram")


###################################################
### code chunk number 24: HistogramTools.Rnw:621-624
###################################################
hist.1 <- hist(c(1,2,3,4), plot=FALSE)
hist.2 <- hist(c(1,2,2,4), plot=FALSE)
hist.sum <- AddHistograms(hist.1, hist.2)


###################################################
### code chunk number 25: mergehist
###################################################
par(mfrow=c(1,3))
plot(hist.1)
plot(hist.2)
plot(hist.sum,main="Aggregated Histogram")


###################################################
### code chunk number 26: HistogramTools.Rnw:645-650
###################################################
  hist.1 <- hist(c(1,2,3), breaks=0:9, plot=FALSE)
  hist.2 <- hist(c(1,2,3), breaks=0:9, plot=FALSE)
  hist.3 <- hist(c(4,5,6), breaks=0:9, plot=FALSE)
  hist.sum <- AddHistograms(hist.1, hist.2, hist.3)
  hist.sum


###################################################
### code chunk number 27: HistogramTools.Rnw:661-663
###################################################
overbinned <- hist(c(rexp(100), 1+rexp(100)), breaks=seq(0, 10, by=.01), plot=FALSE)
better.hist <- MergeBuckets(overbinned, adj=30)


###################################################
### code chunk number 28: downsamplehist
###################################################
par(mfrow=c(1,2))
plot(overbinned)
plot(better.hist)


###################################################
### code chunk number 29: HistogramTools.Rnw:695-697
###################################################
hist.1 <- hist(runif(100, min=0, max=10), breaks=seq(from=0, to=10, by=.5), plot=FALSE)
hist.2 <- SubsetHistogram(hist.1, minbreak=2, maxbreak=6)


###################################################
### code chunk number 30: subsethist
###################################################
par(mfrow=c(1,2))
plot(hist.1, main="hist.1")
plot(hist.2, main="hist.2")


