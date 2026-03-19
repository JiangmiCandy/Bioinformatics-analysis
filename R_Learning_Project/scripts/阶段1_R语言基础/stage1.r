# stage1_demo.R
# ---------------------------
# R 基础语法示例演示
# ---------------------------

cat("=== 1. 变量与数据类型 ===\n")
x_num <- 10        # 数值
x_char <- "R语言"   # 字符
x_log <- TRUE      # 逻辑
x_factor <- factor(c("low","medium","high"))  # 因子

print(x_num)
print(x_char)
print(x_log)
print(x_factor)

cat("\n=== 2. 向量、矩阵、列表、数据框 ===\n")
# 向量
vec <- c(1,2,3,4,5)
print(vec)

# 矩阵
mat <- matrix(1:6, nrow=2)
print(mat)

# 列表
lst <- list(name="Jiangmi", age=24, scores=c(90,85,88))
print(lst)

# 数据框
df <- data.frame(id=1:3, score=c(95,88,76))
print(df)

cat("\n=== 3. 条件语句 ===\n")
a <- 10
if (a > 5) {
  print("a 大于 5")
} else {
  print("a 小于等于 5")
}

cat("\n=== 4. 循环 ===\n")
# for 循环
for(i in 1:5){
  print(i^2)
}

# while 循环
i <- 1
while(i <= 3){
  print(i*10)
  i <- i + 1
}

cat("\n=== 5. 函数定义与调用 ===\n")
# 简单函数
add <- function(x, y){
  return(x + y)
}
result <- add(5, 7)
print(paste("5 + 7 =", result))

# 带默认参数
greet <- function(name="学生"){
  paste("你好,", name)
}
print(greet())
print(greet("Jiangmi"))

cat("\n=== 6. apply 系列函数示例 ===\n")
mat2 <- matrix(1:9, nrow=3)
print("矩阵按行求和 (apply)")
row_sums <- apply(mat2, 1, sum)
print(row_sums)

print("向量平方 (sapply)")
vec2 <- 1:5
vec2_sq <- sapply(vec2, function(x) x^2)
print(vec2_sq)

cat("\n=== 7. 小练习示例 ===\n")
# 创建一个向量，求每个元素 +10 后输出
vec3 <- c(2,4,6)
vec3_plus10 <- vec3 + 10
print(vec3_plus10)

# 生成一个列表包含名字和成绩，并输出
lst2 <- list(name="Alice", score=88)
print(lst2)