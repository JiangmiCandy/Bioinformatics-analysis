# 如果没装先安装
# install.packages("ggplot2")

library(ggplot2)

# 构建数据
df <- data.frame(
  pH = c(6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7),
  A610 = c(0.52, 0.49, 0.45, 0.40, 0.36, 0.42, 0.48)
)

# 作图 + 拟合
p <- ggplot(df, aes(x = pH, y = A610)) +
  geom_point(size = 3) +                         # 原始数据点
  geom_line(linetype = "dashed") +              # 连接线（可选）
  geom_smooth(method = "loess", span = 0.75, se = FALSE, size = 1.2) +  # 拟合曲线
  labs(
    title = "Effect of pH on α-amylase activity",
    x = "pH",
    y = "A610 (Absorbance)"
  ) +
  theme_minimal(base_size = 14)

print(p)