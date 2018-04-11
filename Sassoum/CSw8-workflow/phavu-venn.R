##
## plot a Venn diagram of the CSw8 phavu syntelogs and the phavu seed-weight genes from Schmutz, et al.
##

library("VennDiagram")

CSw8.phavu.genes = read.table("CSw8.phavu.genes.txt")
Schmutz.phavu.genes = read.table("Schmutz.seed-weight.genes.txt")

venn.diagram(filename="CSw8-Schmutz-Venn.png", imagetype="png",
             list(CSw8=CSw8.phavu.genes$V1, SW=Schmutz.phavu.genes$V1),
             fill=c("orange","blue"),
             main="Cowpea CSw8 P.vulgaris syntelogs vs. seed-weight genes from Schmutz, et al.", main.fontfamily="sanserif", main.cex=0.6, 
             sub="Single common gene = Phvul.008G285800", sub.fontfamily="sanserif", sub.cex=0.8,
             print.mode="raw",
             height=2000, width=2000
             )
