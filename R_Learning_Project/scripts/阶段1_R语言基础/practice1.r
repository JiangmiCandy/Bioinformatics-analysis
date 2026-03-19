x_num <- 10
x_char <- "R语言"
x_log <- TRUE
x_factor <- factor(c("low", "medium", "high"))

print(x_num)
print(x_char)
print(x_log)
print(x_factor)

vec <- 10:15
print(vec)
mat <- matrix(1:9, nrow = 3)
print(mat)

lst <- list(name = "Jiangmi", age = 24,scores = c(90, 85, 88))
print(lst)
df <- data.frame(id = 1:3, score = c(95, 88, 76))
print(df)

a <- 10
if(a > 5) {
    print("a > 5")
}