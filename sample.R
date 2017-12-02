# df = data.frame(Time = c(0, 1, 2, 3, 4, 5, 6, 7), col2 = c(6, 2, 3, 13, 2, 50, 2, 5), col3 = c(0,0,0,1,1,1,0,0))
# 
# df$phase[df$Time < df$Time[df$col3==1][1]] = "1"
# df$phase[df$Time > max(df$Time[df$col3==1])] = "3"
# df$phase[df$col3 == 1] = "2"
# phases = split(df, df$phase)
# print(phases[2]$`2`$Time)
library(zoo)
library(ggplot2)
df = read.csv("Subject47.csv")
df.subset = df[df$Drive == 5,]
df.approximated = data.frame(na.approx(df.subset))
# df.approximated[df.approximated$Time > 150 & df.approximated$Time < 186,]$Lane.Position.V5
# qplot(df.approximated$Time, df.approximated$Lane.Position.V5, geom = "line")

df[df$Drive == 5,]$Lane.Position.V5 = df.approximated$Lane.Position.V5
write.csv(df, "out.csv", row.names = F)