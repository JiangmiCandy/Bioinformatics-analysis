memory.limit(102400)
rm(list = ls())
library(Seurat)
rdaf = "sce.all.Rdata"
if(!file.exists(rdaf)){
  f = dir("01_data/")
  scelist = list() #创建空的列表，下面的for循环每执行一次，scelist里面就会多一个元素。
  for(i in 1:length(f)){
    pda <- Read10X(paste0("01_data/",f[[i]]))
    scelist[[i]] <- CreateSeuratObject(counts = pda, 
                                       project = f[[i]],
                                       min.cells = 3,
                                       min.features = 200)
    print(dim(scelist[[i]]))#输出每个文件的基因数和细胞数
  }
  sce.all = merge(scelist[[1]],scelist[-1]) #合并多个对象
  sce.all = JoinLayers(sce.all) 
  #merge后，每个样本的表达矩阵是一个独立的的layer，JoinLayers是合并为一个表达矩阵
  # set.seed(335) ,downsample=700
  sce.all = subset(sce.all)#每个样本抽700个细胞
  save(sce.all,file = rdaf)
}
load(rdaf)
head(sce.all@meta.data)

##                      orig.ident nCount_RNA nFeature_RNA
## AAAGAACAGTCTGTAC-1_1    sample1       3884         1377
## AAAGGGCTCTCGCGTT-1_1    sample1       1615          721
## AAAGGTACAATTGGTC-1_1    sample1       3806         1215
## AAAGTGAGTATCGAAA-1_1    sample1       5554         1456
## AAAGTGATCTCAACCC-1_1    sample1       3111         1328
## AACAAAGGTAAGGTCG-1_1    sample1       3658         1243

table(sce.all$orig.ident) #每个样本多少细胞

## 
## sample1 sample2 sample3 sample4 sample5 sample6 
##     700     700     700     700     700     700

sum(table(Idents(sce.all)))#细胞总数

## [1] 4200
