f = "ob1.Rdata"
if(!file.exists(f)){
  ob1 = seu.obj %>% 
    NormalizeData() %>%  
    FindVariableFeatures() %>%  
    ScaleData(features = rownames(.)) %>%  
    RunPCA(features = VariableFeatures(.))  %>%
    FindNeighbors(dims = 1:15) %>% 
    FindClusters(resolution = 0.5) %>% 
    RunUMAP(dims = 1:15) %>% 
    RunTSNE(dims = 1:15)
  save(ob1,file = f)
}
load(f)