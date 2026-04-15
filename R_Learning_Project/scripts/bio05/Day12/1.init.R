rm(list = ls())
library(Seurat)
library(monocle)
library(dplyr)
load("../Day10/sce.Rdata")
scRNA = sce
table(Idents(scRNA))

head(scRNA@meta.data)

DimPlot(scRNA,label = T)