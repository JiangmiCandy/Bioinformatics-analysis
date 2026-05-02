rm(list = ls())
library(Seurat)
library(monocle)
library(dplyr)
load("../day11/scRNA.Rdata")
table(Idents(scRNA))

table(scRNA$orig.ident)

head(scRNA@meta.data)

DimPlot(scRNA,label = T)+NoLegend()
