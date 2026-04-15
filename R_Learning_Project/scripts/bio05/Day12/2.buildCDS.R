# count矩阵，官方建议用count
ct <- scRNA@assays$RNA$counts
# 基因注释
gene_ann <- data.frame(
  gene_short_name = row.names(ct), 
  row.names = row.names(ct)
)
fd <- new("AnnotatedDataFrame",
          data=gene_ann)
# 临床信息
pd <- new("AnnotatedDataFrame",
          data=scRNA@meta.data)
#新建CellDataSet对象
sc_cds <- newCellDataSet(
  ct, 
  phenoData = pd,
  featureData =fd,
  expressionFamily = negbinomial.size(),
  lowerDetectionLimit=1)
sc_cds