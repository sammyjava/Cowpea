##
## load the CVARS data into the dataframe df and tweak units, etc.
##

df=read.table(file="seed-density_CVARS.tsv", header=T)

## drop some columns
df$X100SeedWeightCVARS2016 = NULL
df$width2 = NULL
df$denominator = NULL
df$density = NULL

colnames(df) = c("Accession", "mass", "length", "width")

## switch to cm rather than mm
df$length = df$length/10
df$width = df$width/10

## use ELLIPSOID formula for volume (in g/cm^3 now)
df$volume = pi/6*df$length*df$width^2

## log values used for fitting power laws
logwidth = log(df$width)
loglength = log(df$length)
logmass = log(df$mass)

## derived, not independent, measure
logvolume = log(df$volume)

## power-law regressions
lm.mass.volume = lm(logmass ~ logvolume)
lm.mass.length.width = lm(logmass ~ loglength + logwidth)
