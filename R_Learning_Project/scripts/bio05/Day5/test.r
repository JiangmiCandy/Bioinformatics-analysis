x <- c(1, 2, 3)
print(x)

x <- 1 : 10
print(x)

x <- seq(1, 10, by = 0.5)
print(x)

x <- rep(1:3, times = 2)
print(x)

x[4]
x[-4]
x[2:4]
x[-(2:4)]
x[c(1, 5)]

x[x == 10]
x[x < 0]
x[x %in% c(1, 2, 5)]
