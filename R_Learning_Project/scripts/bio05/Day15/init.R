rm(list = ls())
library(Seurat)
library(GSVA)
library(clusterProfiler)
load("../day11/scRNA.Rdata")
seu.obj = scRNA
table(Idents(seu.obj))

exp  =  AverageExpression(seu.obj)[[1]]
#exp =  AggregateExpression(seu.obj)[[1]]
exp  =  as.matrix(exp)
exp  =  exp[rowSums(exp)>0,] 
exp[1:4,1:4]