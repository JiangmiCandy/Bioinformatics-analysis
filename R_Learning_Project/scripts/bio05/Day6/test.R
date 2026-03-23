test <- iris[c(1:2,51:52,101:102),]

mutate(test, new = Sepal.Length * Sepal.Width)