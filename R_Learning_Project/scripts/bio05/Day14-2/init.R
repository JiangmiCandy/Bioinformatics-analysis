rm(list = ls())
library(tidyverse)
library(Seurat)
load("../day11/sce.all.Rdata") #day7读取并抽样的数据
sce.all[["percent.mt"]] <- PercentageFeatureSet(sce.all, pattern = "^MT-")
sce.all[["percent.rp"]] <- PercentageFeatureSet(sce.all, pattern = "^RP[SL]")
sce.all[["percent.hb"]] <- PercentageFeatureSet(sce.all, pattern = "^HB[^(P)]")

VlnPlot(sce.all, 
        features = c("nFeature_RNA",
                     "nCount_RNA", 
                     "percent.mt",
                     "percent.rp",
                     "percent.hb"),
        ncol = 3,pt.size = 0.5, group.by = "orig.ident")