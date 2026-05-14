exp.mat <- read.delim("nestorawa_forcellcycle_expressionMatrix.txt",row.names = 1)
marrow <- CreateSeuratObject(counts = exp.mat,
                             project = "b",
                             min.cells = 3, 
                             min.features = 200)
marrow[["percent.mt"]] <- PercentageFeatureSet(marrow, pattern = "^MT-")
head(marrow@meta.data, 3)

VlnPlot(marrow, 
        features = c("nFeature_RNA",
                     "nCount_RNA", 
                     "percent.mt"), 
        ncol = 3,pt.size = 0.5)