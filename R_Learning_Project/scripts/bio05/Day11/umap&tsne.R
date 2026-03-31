f = "obj.Rdata"
library(harmony)
if(!file.exists(f)){
  sce.all = sce.all %>% 
    NormalizeData() %>%  
    FindVariableFeatures() %>%  
    ScaleData(features = rownames(.)) %>%  
    RunPCA(pc.genes = VariableFeatures(.))  %>%
    RunHarmony("orig.ident") %>%
    FindNeighbors(dims = 1:15, reduction = "harmony") %>% 
    FindClusters(resolution = 0.5) %>% 
    RunUMAP(dims = 1:15,reduction = "harmony") %>% 
    RunTSNE(dims = 1:15,reduction = "harmony")
  save(sce.all,file = f)
}
load(f)
ElbowPlot(sce.all)
