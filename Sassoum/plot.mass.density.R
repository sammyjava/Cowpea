plot(df$volume, df$mass, log="xy", xlab="Seed Volume (cm^-3)", ylab="Seed Mass (g)", main="CVARS Seed Measurements")

lines(1:70/200, 0.55*sqrt(1:70/200), col="blue", lw=2)
text(0.02, 0.12, "mass ~ sqrt(volume)", col="blue")

lines(1:70/200, 5*(1:70/200), col="red")
lines(1:70/200, 2*(1:70/200), col="red")
lines(1:70/200, 1*1:70/200, col="red")

text(0.010, 0.05, "5 g/cm^2", col="red", pos=4)
text(0.025, 0.05, "2 g/cm^2", col="red", pos=4)
text(0.050, 0.05, "1 g/cm^2", col="red", pos=4)

