library(celldex)
library(SingleR)
ls("package:celldex")

## [1] "BlueprintEncodeData"              "DatabaseImmuneCellExpressionData"
## [3] "HumanPrimaryCellAtlasData"        "ImmGenData"                      
## [5] "MonacoImmuneData"                 "MouseRNAseqData"                 
## [7] "NovershternHematopoieticData"

f = "../day6/ref_BlueprintEncode.RData"
#用了昨天文件夹里的数据，day6是昨天的文件夹名，按需修改
if(!file.exists(f)){
  ref <- celldex::BlueprintEncodeData()
  save(ref,file = f)
}
ref <- get(load(f))
library(BiocParallel)
scRNA = sce.all
test = scRNA@assays$RNA$data
pred.scRNA <- SingleR(test = test, 
                      ref = ref,
                      labels = ref$label.main, 
                      clusters = scRNA@active.ident)
pred.scRNA$pruned.labels

##  [1] "CD4+ T-cells"      "Fibroblasts"       "B-cells"          
##  [4] "CD8+ T-cells"      "Neutrophils"       "Monocytes"        
##  [7] "Adipocytes"        "CD4+ T-cells"      "B-cells"          
## [10] "NK cells"          "Fibroblasts"       "Adipocytes"       
## [13] "Monocytes"         "Endothelial cells" "Monocytes"

new.cluster.ids <- pred.scRNA$pruned.labels
names(new.cluster.ids) <- levels(scRNA)
scRNA <- RenameIdents(scRNA,new.cluster.ids)
save(scRNA,file = "scRNA.Rdata")
p2 <- DimPlot(scRNA, reduction = "umap",label = T,pt.size = 0.5) + NoLegend()
p1+p2