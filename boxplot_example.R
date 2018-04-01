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


# p.legend = g_legend(p)
# p = p + theme(legend.position="none")
# p2 = p2 + theme(legend.position="none")
hs = c(9/10, 1/10)
grid.arrange(p, p2, ncol = 2, heights = hs)




# p = ggplot(df, aes(drive, pp)) + geom_boxplot(fill = c("green","grey")) + labs(title = "", y="", x="")
# p = p + theme(plot.title = element_text(hjust = 0.5, size = rel(2)), plot.margin=unit(c(0,1,0.5,0.5), "cm"), legend.position = "bottom", axis.text.y = element_text(size = 10), axis.title.y = element_text(size = 13), panel.background = element_rect(fill = "#FFFF0044", colour = "grey50"), panel.grid.minor = element_blank(), panel.grid.major = element_blank(), axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank())
