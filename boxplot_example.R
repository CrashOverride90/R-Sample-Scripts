rm(list = ls())

library(ggplot2)
library(gridExtra)

g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}

df = data.frame(Subject = c(52,53,53,54,54,55,56,56,57,52,53,53,54,54,55,56,56,57), drive = c("ND","LD","ND","LD","ND","LD","ND","LD","ND","ND","LD","ND","LD","ND","LD","ND","LD","ND"), pp = c(1.695758,1.469545,1.825524,1.654934,1.777749,1.776436,1.662406,1.524293,1.400161,1.695758,1.469545,1.635294,1.654934,1.204325,1.776436,1.662406,1.524293,1.307778))
p = ggplot(df, aes(drive, pp)) + geom_boxplot(aes(fill = drive), show.legend = TRUE) + labs(title = "", y="", x="") + theme(legend.position = "bottom", legend.title = element_blank()) + scale_fill_manual(values = c("green", "grey")) + scale_x_discrete(labels = c("CD", "ND"))
p2 = ggplot(df, aes(drive, pp)) + geom_boxplot(aes(fill = drive[1])) + labs(title = "", y="", x="")

hs = c(9/10, 1/10)
grid.arrange(p, p2, ncol = 2, heights = hs)
