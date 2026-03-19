library(tidyverse)

# 1.导入CSV文件
df <- read_csv("../data/stage2/sample_data.csv")
cat("数据导入")
print(df)

# 2.查看数据基本信息
cat("数据结构")
str(df)

cat("数据摘要")
summary(df)

# 3.选择和过滤
cat("选择列")
df_sel <- select(df, name, value)
print(df_sel)

cat("过滤行 (value > 6)")
df_filt <- filter(df, value > 6)
print(df_filt)

cat("按value排序")
df_sort <- arrange(df, desc(value))
print(df_sort)

