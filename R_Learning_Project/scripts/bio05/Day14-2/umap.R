library(harmony)
f = "ob1m.Rdata"
if(!file.exists(f)){
  ob1 = seu.obj %>% 
    NormalizeData() %>%  
    FindVariableFeatures() %>%  
    ScaleData(features = rownames(.)) %>%  
    RunPCA(pc.genes = VariableFeatures(.))  %>%
    RunHarmony("orig.ident") %>%
    FindNeighbors(dims = 1:15, reduction = "harmony") %>% 
    FindClusters(resolution = 0.5) %>% 
    RunUMAP(dims = 1:15,reduction = "harmony") %>% 
    RunTSNE(dims = 1:15,reduction = "harmony")
  save(ob1,file = f)
}
load(f)