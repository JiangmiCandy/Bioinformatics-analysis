library(BiocParallel)
scRNA = seu.obj
test = scRNA@assays$RNA$data
pred.scRNA <- SingleR(test = test, 
                      ref = ref,
                      labels = ref$label.main, 
                      clusters = scRNA@active.ident)
pred.scRNA$pruned.labels

##  [1] "B-cells"           "CD8+ T-cells"      "CD4+ T-cells"     
##  [4] "CD4+ T-cells"      "CD4+ T-cells"      "B-cells"          
##  [7] "Monocytes"         "Endothelial cells" "Fibroblasts"      
## [10] "NK cells"          "Endothelial cells" NA

new.cluster.ids <- pred.scRNA$pruned.labels
new.cluster.ids[is.na(new.cluster.ids)] = "unknown"#如有NA，就替换为unknown,没有NA的话这句代码运行完就没有变化，不需要删掉。
names(new.cluster.ids) <- levels(scRNA)
scRNA <- RenameIdents(scRNA,new.cluster.ids)
p3 <- DimPlot(scRNA, reduction = "umap",label = T,pt.size = 0.5) + NoLegend()
p1+p3