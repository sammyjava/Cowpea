##
## load the CVARS data into the dataframe df using CGS units throughout.
##

df=read.table(file="seed-density_CVARS.tsv", header=T)

## FUDGE - drop the outlier, row 315 TVu-9468
df = df[-315,]

## drop some columns
df$X100SeedWeightCVARS2016 = NULL
df$width2 = NULL
df$denominator = NULL
df$density = NULL

colnames(df) = c("accession", "mass", "length", "width")

## switch to cm rather than mm
df$length = df$length/10
df$width = df$width/10

## use ELLIPSOID formula for volume (in g/cm^3 now)
df$volume = pi/6*df$length*df$width^2

## recalculate density with new units and volume definition
df$density = df$mass/df$volume

## log values used for fitting power laws
logwidth = log(df$width)
loglength = log(df$length)
logmass = log(df$mass)

## derived, not independent, measure
logvolume = log(df$volume)

## power-law regressions
lm.mass.volume = lm(logmass ~ logvolume)
lm.mass.length.width = lm(logmass ~ loglength + logwidth)
