# x <- read.csv(‘./R_Learning_Project/scripts/bio05/Day5/doudou.txt‘)
#read.table("huahua.txt", sep = '\t',  header = T)
a <- read.table(file = "./scripts/bio05/Day5/huahua.txt", sep = "\t", header = T)

print(a)

# colnames(a)
# rownames(a)
# dim(a)
save(a, file = "./scripts/bio05/Day5/huahua.Rdata")
save.image("./scripts/bio05/Day5/huahua_all.Rdata")


