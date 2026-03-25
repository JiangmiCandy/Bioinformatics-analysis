if(!require("BiocManager")) install.packages("BiocManager",update = F,ask = F)
options(BioC_mirror="https://mirrors.westlake.edu.cn/bioconductor")
#来自cran的包放在一个向量里
cran_packages <- c('tidyverse',
                   'msigdbr',
                   'patchwork',
                   'SeuratObject',
                   'Seurat','devtools',#忽略颜色差别，因为我后加的
                   'ggalluvial','AnnoProbe',
                   'ggpubr','pheatmap',
                   'NMF','ggsci','survminer',
                   'harmony','tinyarray'
                   ) 
#来自bioconductor的包放在一个向量里
Biocductor_packages <- c('sva','monocle','GEOquery',
                         'GOplot','GSEABase','scrapper',
                         'GSVA','plotmo','monocle',
                         'regplot','scRNAseq',
                         'BiocStyle','celldex',
                         'SingleR','BiocParallel','GSVA',
                         'AUCell','DelayedArray','GO.db','DO.db',
                         'DelayedMatrixStats','org.Hs.eg.db', 
                         'org.Mm.eg.db','clusterProfiler',
                         'Biobase','BiocNeighbors',
                         'BiocGenerics','ComplexHeatmap'

)
#用for循环批量安装来自cran的包
for (pkg in cran_packages){
  if (! require(pkg,character.only=T,quietly = T) ) {
    install.packages(pkg,ask = F,update = F)
    require(pkg,character.only=T) 
  }
}

#用for循环批量安装来自bioconductor的包
for (pkg in Biocductor_packages){
  if (! require(pkg,character.only=T,quietly = T) ) {
    BiocManager::install(pkg,ask = F,update = F)
    require(pkg,character.only=T) 
  }
}
#再次加载所有包，检查有没有没安装好的
for (pkg in c(Biocductor_packages,cran_packages)){
  require(pkg,character.only=T) 
}
#查看Seurat的版本
packageVersion("Seurat")