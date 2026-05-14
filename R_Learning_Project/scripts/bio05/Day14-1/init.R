rm(list = ls())
library(tidyverse)
library(Seurat)
ct = Read10X("../day9/sample1/input/")
seu.obj <- CreateSeuratObject(counts = ct, 
                              min.cells = 3, 
                              min.features = 200)
set.seed(1234)
seu.obj = subset(seu.obj,downsample = 3000)
seu.obj[["percent.mt"]] <- PercentageFeatureSet(seu.obj, pattern = "^MT-")
VlnPlot(seu.obj, 
        features = c("nFeature_RNA",
                     "nCount_RNA", 
                     "percent.mt"), 
        ncol = 3,pt.size = 0.5)