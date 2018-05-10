dat <- data.frame(
  pos = c(1, 3, 5, 8, 10, 12),
  start = c(1,3, 6, 7, 10, 11),
  end = c(5, 6, 9, 9, 13, 12)
)

plot(c(0,13),c(1,max(dat$pos)),type = "n",axes = FALSE,xlab = "Position",ylab = "")
segments(x0 = dat$start,
         y0 = dat$pos,
         x1 = dat$end,
         y1 = dat$pos,
         col = "blue",
         lwd = 6,
         lend = 2)
text(x = dat$start - 0.5,y = dat$pos,labels = dat$pos,font = 2)
axis(1)
# axis(1,at = c(0,12),labels = FALSE,tcl = 0.5)