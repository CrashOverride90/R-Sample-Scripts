plot(1:10, type="l")
val = 10
exp = as.expression(bquote(italic(CL)~italic(n == .(val))))
legend("bottomright", legend=exp)
