my_sub = "Fibroblasts"
sub.cells <- subset(seu.obj, idents = my_sub)
f = "obj.Rdata"
if(!file.exists(f)){
  sub.cells = sub.cells %>%
    NormalizeData() %>%
    FindVariableFeatures() %>%
    ScaleData(features = rownames(.)) %>%
    RunPCA(features = VariableFeatures(.))  %>%
    FindNeighbors(dims = 1:15) %>%
    FindClusters(resolution = 0.5) %>%
    RunUMAP(dims = 1:15) 
  save(sub.cells,file = f)
}

load(f)
DimPlot(sub.cells, reduction = 'umap',label = T)+NoLegend()