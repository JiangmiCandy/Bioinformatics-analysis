sc_cds <- estimateSizeFactors(sc_cds)
sc_cds <- estimateDispersions(sc_cds)
fdif = "diff_test_res2.Rdata"
if(!file.exists(fdif)){
  diff_test_res <- differentialGeneTest(sc_cds,
                                        fullModelFormulaStr = " ~ celltype + orig.ident", 
                                        reducedModelFormulaStr = " ~ orig.ident", 
                                        cores = 10)
  save(diff_test_res,file = fdif)
}
load(fdif)
ordering_genes <- row.names(subset(diff_test_res, qval < 0.01))
#查看基因，筛选适合用于排序的，设置为排序要使用的基因
head(ordering_genes)

length(ordering_genes)

sc_cds <- setOrderingFilter(sc_cds, ordering_genes)
#画出选择的基因
plot_ordering_genes(sc_cds)