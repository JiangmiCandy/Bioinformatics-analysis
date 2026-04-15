library(ggplot2)

# 取 raw counts
expr <- as.matrix(scRNA@assays$RNA$counts)

# 计算每个基因平均表达
mean_expression <- rowMeans(expr)

# 计算每个基因方差
gene_var <- apply(expr, 1, var)

# 计算离散度
dispersion_empirical <- gene_var / (mean_expression + 1e-6)

# 整理数据
plot_df <- data.frame(
  gene = rownames(expr),
  mean_expression = mean_expression,
  dispersion_empirical = dispersion_empirical,
  is_ordering = rownames(expr) %in% ordering_genes
)

# 去掉异常值
plot_df <- plot_df[is.finite(plot_df$mean_expression) &
                     is.finite(plot_df$dispersion_empirical), ]
plot_df <- plot_df[plot_df$mean_expression > 0 &
                     plot_df$dispersion_empirical > 0, ]

# 作图
ggplot(plot_df, aes(x = mean_expression, y = dispersion_empirical)) +
  geom_point(aes(color = is_ordering), size = 1, alpha = 0.7) +
  scale_color_manual(values = c("FALSE" = "grey70", "TRUE" = "black")) +
  scale_x_log10() +
  scale_y_log10() +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  theme_bw() +
  labs(
    x = "mean_expression",
    y = "dispersion_empirical",
    color = NULL
  )