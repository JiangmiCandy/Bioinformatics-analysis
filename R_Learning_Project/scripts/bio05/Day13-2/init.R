rm(list = ls())
library(Seurat)
library(dplyr)
load("../day10/sce.Rdata")
seu.obj = sce
head(seu.obj@meta.data)

p1 = DimPlot(seu.obj, reduction = "umap",label=T)+NoLegend()
p1