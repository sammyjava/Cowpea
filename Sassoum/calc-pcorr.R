##
## calculate the Pearson correlation coefficients between the various traits
## this uses the actual data, not log(data)
##
## df: mass length width volume density

pcor.mass.length = cor.test(df$mass, df$length, method="pearson")
pcor.mass.width  = cor.test(df$mass, df$width, method="pearson")
pcor.mass.volume = cor.test(df$mass, df$volume, method="pearson")
pcor.mass.density = cor.test(df$mass, df$density, method="pearson")

pcor.length.width = cor.test(df$length, df$width, method="pearson")
pcor.length.volume = cor.test(df$length, df$volume, method="pearson")
pcor.length.density = cor.test(df$length, df$density, method="pearson")

pcor.width.volume = cor.test(df$width, df$volume, method="pearson")
pcor.width.density = cor.test(df$width, df$density, method="pearson")

pcor.volume.density = cor.test(df$volume, df$density, method="pearson")


