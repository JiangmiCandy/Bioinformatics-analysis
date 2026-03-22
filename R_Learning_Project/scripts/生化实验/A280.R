library(ggplot2)

# 原始数据
df <- data.frame(
  A280 = c(0.000, 0.062, 0.088, 0.192, 0.268),
  Protein = c(0.000, 0.233, 0.464, 0.693, 0.921)
)

# 拟合模型
fit <- lm(Protein ~ A280, data = df)

# 新样品
new_A280 <- 0.081

# 预测 Protein
pred_protein <- predict(fit, newdata = data.frame(A280 = new_A280))

# 作图
options(repr.plot.width = 9, repr.plot.height = 3)

ggplot(df, aes(x = A280, y = Protein)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  
  # 高亮新点（红色）
  geom_point(aes(x = new_A280, y = pred_protein),
             color = "red", size = 4) +
  
  # 标注坐标
  annotate("text",
           x = new_A280,
           y = pred_protein,
           label = paste0(
             "(", round(new_A280, 3), ", ",
             round(pred_protein, 3), " g/L)"
           ),
           vjust = -1) +
  
  # 坐标轴标签
  labs(
    x = "A280",
    y = "Protein (g/L)",
    title = "Protein Standard Curve"
  ) +
  
  theme_minimal()
