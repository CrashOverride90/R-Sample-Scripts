# COMBINED PLOT LEGEND

df1 <- read.table(text="group   x     y   
                  group1 -0.212201  0.358867
                  group2 -0.279756 -0.126194
                  group3  0.186860 -0.203273
                  group4  0.417117 -0.002592
                  group1 -0.212201  0.358867
                  group2 -0.279756 -0.126194
                  group3  0.186860 -0.203273
                  group4  0.186860 -0.203273",header=TRUE)

df2 <- read.table(text="group   x     y   
                  group1  0.211826 -0.306214
                  group2 -0.072626  0.104988
                  group3 -0.072626  0.104988
                  group4 -0.072626  0.104988
                  group1  0.211826 -0.306214
                  group2 -0.072626  0.104988
                  group3 -0.072626  0.104988
                  group4 -0.072626  0.104988",header=TRUE)


library(ggplot2)
library(gridExtra)

p1 <- ggplot(df1, aes(x=x, y=y,colour=group)) + geom_point(position=position_jitter(w=0.04,h=0.02),size=1.8) + theme(legend.position="bottom")

p2 <- ggplot(df2, aes(x=x, y=y,colour=group)) + geom_point(position=position_jitter(w=0.04,h=0.02),size=1.8) +
theme(legend.position="bottom")

#extract legend
#https://github.com/hadley/ggplot2/wiki/Share-a-legend-between-two-ggplot2-graphs
g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}

mylegend1<-g_legend(p1)
mylegend2<-g_legend(p2)

p1 <- p1 + theme(legend.position = "none")
p2 <- p2 + theme(legend.position = "none")
p3 <- grid.arrange(p1, p2, mylegend1, ncol=2, widths = c(50,50))


