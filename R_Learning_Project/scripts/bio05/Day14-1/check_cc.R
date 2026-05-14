check_cc =  function(ob){
  s.genes <- intersect(cc.genes$s.genes,rownames(ob))
  g2m.genes <- intersect(cc.genes$g2m.genes,rownames(ob))
  ob = ob %>% 
    NormalizeData() %>%  
    FindVariableFeatures() %>%  
    CellCycleScoring(s.features = s.genes, 
                     g2m.features = g2m.genes) %>%
    ScaleData(features = rownames(.)) %>%  
    RunPCA(features = c(s.genes,g2m.genes))
  return(ob)
}
ch1 = check_cc(seu.obj)
head(ch1@meta.data)