library(celldex)
library(SingleR)
ls("package:celldex")

f = "../day6/ref_BlueprintEncode.RData"
if(!file.exists(f)){
  ref <- celldex::BlueprintEncodeData()
  save(ref,file = f)
}
ref <- get(load(f))
library(BiocParallel)
scRNA = ob1
test = scRNA@assays$RNA$data
pred.scRNA <- SingleR(test = test, 
                      ref = ref,
                      labels = ref$label.main, 
                      clusters = scRNA@active.ident)
new.cluster.ids <- pred.scRNA$pruned.labels
new.cluster.ids[is.na(new.cluster.ids)] = "unknown"#如有NA，就替换为unknown,没有NA的话这句代码运行完就没有变化，不需要删掉。
names(new.cluster.ids) <- levels(scRNA)
scRNA <- RenameIdents(scRNA,new.cluster.ids)
p3 <- DimPlot(scRNA, reduction = "umap",label = T,pt.size = 0.5) + NoLegend()
m = scRNA