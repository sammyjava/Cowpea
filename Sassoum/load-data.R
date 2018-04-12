##
## load the CVARS data into the dataframe df using CGS units throughout.
##
## Accession       X100SeedWeightCVARS2016  seedmass        Average10seedslength_mm Average10seedswidth_mm  width2  denominator     density

df=read.table(file="seed-density_CVARS.tsv", header=T)

## put the accessions in row names
rownames(df) = df$Accession

## drop some columns
df$Accession = NULL
df$X100SeedWeightCVARS2016 = NULL
df$width2 = NULL
df$denominator = NULL
df$density = NULL

colnames(df) = c("mass", "length", "width")

## switch to cm rather than mm
df$length = df$length/10
df$width = df$width/10

## use ELLIPSOID formula for volume (in g/cm^3 now)
df$volume = pi/6*df$length*df$width^2

## recalculate density with new units and volume definition
df$density = df$mass/df$volume

## log values used for fitting power laws and such
log.df = log(df)

## power-law regressions
lm.mass.volume = lm(log.df$mass ~ log.df$volume)
lm.mass.length.width = lm(log.df$mass ~ log.df$length + log.df$width)

## principal component analysis on independent measurements
pca.mass.length.width = prcomp(log.df[,1:3], center = TRUE, scale. = TRUE)

## principal component analysis on density and size measurements
pca.density.length.width = prcomp(log.df[,c(5,2,3)], center = TRUE, scale. = TRUE)
