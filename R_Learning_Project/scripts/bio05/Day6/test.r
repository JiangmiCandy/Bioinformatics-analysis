# test <- iris[c(1:2, 51:52, 101:102), ]

# mutate(test, new = Sepal.Length * Sepal.Width)  #新增名为new的列

# select(test, 1)  #按列号筛选
# select(test, c(1, 5))
# select(test, Sepal.Length)

# select(test, Petal.Length, Petal.Width)    #按列名筛选
# vars <- c("Petal.Length", "Petal.Width")
# select(test, one_of(vars))

# filter(test, Species == “setosa”)    #筛选行
# filter(test, Species == "setosa"&Sepal.Length > 5)
# filter(test, Species %in% c("setosa", "versicolor"))

# arrange(test, Sepal.Length) #默认从小到大排序，按某一列或某几列对整个表格进行排序
# arrange(test, desc(Sepal.Length))#用desc从大到小

# summarise(test, mean(Sepal.Length), sd(Sepal.Length))# 计算Sepal.Length的平均值和标准差
# 先按照Species分组，计算每组Sepal.Length的平均值和标准差
# group_by(test, Species)
# summarise(group_by(test, Species),mean(Sepal.Length), sd(Sepal.Length))

#管道操作 %>% (cmd/ctr + shift + M)（加载任意一个tidyverse包即可用管道符号）
# test %>% 
#   group_by(Species) %>% 
#   summarise(mean(Sepal.Length), sd(Sepal.Length))

#count统计某列的unique值
# count(test,Species)

#将2个表进行连接
# test1 <- data.frame(x = c('b','e','f','x'), 
#                     z = c("A","B","C",'D'))
# test1

# test2 <- data.frame(x = c('a','b','c','d','e','f'), 
#                     y = c(1,2,3,4,5,6))
# test2

#內连inner_join,取交集
# inner_join(test1, test2, by = "x")

#左连left_join
# left_join(test1, test2, by = "x")

#全连full_join
# full_join(test1, test2, by = "x")

#半连接：返回能够与y表匹配的x表所有记录semi_join
# semi_join(test1, test2, by = "x")

#反连接：返回无法与y表匹配的x表的所记录anti_join
# anti_join(test1, test2, by = "x")

#简单合并，在相当于base包里的cbind()函数和rbind()函数;注意，bind_rows()函数需要两个表格列数相同，而bind_cols()函数则需要两个数据框有相同的行数
# test1 <- data.frame(x = c(1,2,3,4), y = c(10,20,30,40))
# test1
# 
# test2 <- data.frame(x = c(5,6), y = c(50,60))
# test2
# 
# test3 <- data.frame(z = c(100,200,300,400))
# test3
# 
# bind_rows(test1, test2)
# 
# bind_cols(test1, test3)
