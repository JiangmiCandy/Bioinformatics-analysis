# ========================================
# Step 0: 镜像检查与国际源设置
# ========================================

# 你希望使用国际镜像
desired_cran <- "https://cloud.r-project.org"
current_cran <- getOption("repos")["CRAN"]

if (current_cran != desired_cran) {
  message("⚡ 当前 CRAN 镜像不是国际源，自动切换到国际镜像")
  options(repos = c(CRAN = desired_cran))
}

# Bioconductor 默认镜像即可，不用改
# 也可以显示设置：
options(BioC_mirror = "https://bioconductor.org")

# ========================================
# Step 1: 准备 BiocManager
# ========================================
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# ========================================
# Step 2: 定义包列表
# ========================================
cran_packages <- unique(c(
  'tidyverse','msigdbr','patchwork','SeuratObject','Seurat',
  'devtools','ggalluvial','AnnoProbe','ggpubr','pheatmap',
  'NMF','ggsci','survminer','harmony','tinyarray'
))

bioc_packages <- unique(c(
  'sva','monocle','GEOquery','GOplot','GSEABase',
  'GSVA','scRNAseq','BiocStyle','celldex','SingleR',
  'BiocParallel','AUCell','DelayedArray','GO.db','DO.db',
  'DelayedMatrixStats','org.Hs.eg.db','org.Mm.eg.db',
  'clusterProfiler','Biobase','BiocNeighbors',
  'BiocGenerics','ComplexHeatmap'
))

all_packages <- c(cran_packages, bioc_packages)

# ========================================
# Step 3: 批量安装函数
# ========================================
install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message("📦 Installing: ", pkg)
    
    tryCatch({
      if (pkg %in% cran_packages) {
        install.packages(pkg, ask = FALSE, update = FALSE)
      } else {
        BiocManager::install(pkg, ask = FALSE, update = FALSE)
      }
    }, error = function(e) {
      message("❌ Failed to install: ", pkg)
    })
  }
}

# 批量安装
invisible(lapply(all_packages, install_if_missing))

# ========================================
# Step 4: 验证函数
# ========================================
check_pkg <- function(pkg) {
  installed <- requireNamespace(pkg, quietly = TRUE)
  
  loadable <- FALSE
  version <- NA
  
  if (installed) {
    loadable <- tryCatch({
      library(pkg, character.only = TRUE)
      TRUE
    }, error = function(e) FALSE)
    
    version <- tryCatch({
      as.character(packageVersion(pkg))
    }, error = function(e) NA)
  }
  
  data.frame(
    package = pkg,
    installed = installed,
    loadable = loadable,
    version = version
  )
}

# ========================================
# Step 5: 输出报告
# ========================================
result <- do.call(rbind, lapply(all_packages, check_pkg))

print(result)

cat("\n====== 问题包 ======\n")
print(subset(result, installed == FALSE))
print(subset(result, installed == TRUE & loadable == FALSE))

# ========================================
# Step 6: 核心包版本检查示例
# ========================================
if ("Seurat" %in% rownames(installed.packages())) {
  message("Seurat version: ", packageVersion("Seurat"))
}
