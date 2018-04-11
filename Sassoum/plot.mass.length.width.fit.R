plot(df$volume, df$mass, log="xy", xlab="Seed Volume (cm^-3)", ylab="Seed Mass (g)", main="CVARS Seed Measurements")

points(df$volume, exp(-0.9229)*df$length^0.7016*df$width^0.9131, col="blue")
text(0.01, 0.2, "mass ~ length^0.70 width^0.91", col="blue", pos=4)
