df = data.frame(Time = c(0, 1, 2, 3, 4, 5, 6, 7), col2 = c(6, 2, 3, 13, 2, 50, 2, 5), col3 = c(0,0,0,1,1,1,0,0))

df$phase[df$Time < df$Time[df$col3==1][1]] = "1"
df$phase[df$Time > max(df$Time[df$col3==1])] = "3"
df$phase[df$col3 == 1] = "2"
phases = split(df, df$phase)
print(phases[2]$`2`$Time)