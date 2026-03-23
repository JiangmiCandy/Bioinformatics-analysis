# test <- iris[c(1:2, 51:52, 101:102), ]

mutate(test, new = Sepal.Length * Sepal.Width)  #新增名为new的列

# select(test, 1)  #按列号筛选
# select(test, c(1, 5))
# select(test, Sepal.Length)

# select(test, Petal.Length, Petal.Width)    #按列名筛选
# vars <- c("Petal.Length", "Petal.Width")
# select(test, one_of(vars))

# filter(test, Species == “setosa”)    #筛选行
# filter(test, Species == "setosa"&Sepal.Length > 5)
# filter(test, Species %in% c("setosa", "versicolor"))

# arrange    #按某一列或某几列对整个表格进行排序

