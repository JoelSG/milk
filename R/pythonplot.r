pythonplot <- function(file='foo',  xlab=trunc(Sys.time() - (60*20), "min"), up.col='yellow', dn.col='yellow4', main='Nasdaq 100 components') {

  bar   = read.table(file)
  ups   = length(bar[(bar>0),])
  downs = length(bar[(bar<0),])

  baz = as.numeric(bar[,1])
 
  dens  =  density(baz)
  x1    =  min(which(dens$x >= 0))
  x2    =  max(which(dens$x <  1))
  x3    =  min(which(dens$x >= -1))
  x4    =  max(which(dens$x <  0))

  #png("1.png")
  #pdf("1.pdf")
  plot(dens, xlab=xlab, ylab="", main=main, yaxt="n")
  with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col=up.col))
  with(dens, polygon(x=c(x[c(x3,x3:x4,x4)]), y= c(0, y[x3:x4], 0), col=dn.col))
  legend("topleft", inset=.01,  legend=c(ups,downs), fill=c(up.col, dn.col), cex=.8, bty='n')

}
