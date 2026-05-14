s.genes <- intersect(cc.genes$s.genes,rownames(seu.obj))
g2m.genes <- intersect(cc.genes$g2m.genes,rownames(seu.obj))
f = "ob2.Rdata"
if(!file.exists(f)){
  ob2 = seu.obj %>% 
    NormalizeData() %>%  
    FindVariableFeatures() %>%  
    CellCycleScoring(s.features = s.genes, g2m.features = g2m.genes) %>%
    ScaleData(vars.to.regress = c("S.Score", "G2M.Score"),features = rownames(.)) %>%  #运行极其慢
    RunPCA(features = VariableFeatures(.))  %>%
    FindNeighbors(dims = 1:15) %>% 
    FindClusters(resolution = 0.5) %>% 
    RunUMAP(dims = 1:15) %>% 
    RunTSNE(dims = 1:15)
  save(ob2,file = f)
}
load(f)
p1 <- DimPlot(ob1, reduction = "umap",label = T)+NoLegend()
p2 <- DimPlot(ob2, reduction = "umap",label = T)+NoLegend()
p1+p2